require File.dirname(__FILE__) + '/../test_helper'

class RequestNotificationsTest < Test::Unit::TestCase
  include Ebay
  include Ebay::Types

  def setup
    @ebay_api = Api.new site_id: 3
    @success = responses(:official_time_success)
    @failure = responses(:official_time_failure, code: 400)
  end

  def test_default_event_name
    Ebay::HttpMock.respond_with(@success)

    with_subscription_to_events do |events|
      @ebay_api.get_ebay_official_time

      assert_equal 1, events.size

      assert_equal Ebay::Api::DEFAULT_REQUEST_EVENT_NAME, events.last[0]
    end
  end

  # Shows that configured event name
  # via 'request_event_name' is applied
  # to fired events. Example config:
  #
  # Ebay::Api.configure do |api|
  #   api.request_event_name = 'custom_event_name'
  # end
  #
  # So events with customized name will be fired.
  def test_custom_event_name
    custom_event_name = 'ebay.request'

    default_event_name = Api.request_event_name
    Api.request_event_name = custom_event_name

    Ebay::HttpMock.respond_with(@success)

    with_subscription_to_events do |events|
      @ebay_api.get_ebay_official_time

      assert_equal 1, events.size

      assert_equal custom_event_name, events.last[0]
    end

    Api.request_event_name = default_event_name
  end

  def test_notification_fired_on_successful_request
    Ebay::HttpMock.respond_with(@success)

    with_subscription_to_events do |events|
      @ebay_api.get_ebay_official_time

      assert_equal 1, events.size

      assert_common_event_data(
        events.last,
        expected_api_endpoint: 'GeteBayOfficialTime'
      )
      assert_response_in(events.last, expected_status: 200)
    end
  end

  def test_notification_fired_on_failed_request
    Ebay::HttpMock.respond_with(@failure)

    with_subscription_to_events do |events|
      # Ebay::ClientError is raised because of response status 400
      assert_raise(Ebay::ClientError) { @ebay_api.get_ebay_official_time }

      assert_equal 1, events.size

      assert_common_event_data(
        events.last,
        expected_api_endpoint: 'GeteBayOfficialTime'
      )
      assert_response_in(events.last, expected_status: 400)
    end
  end

  # Shows that request context can be defined
  # for entire client context like:
  #
  # Ebay::Api.new(
  #   auth_token: ebay_auth_token,
  #   site_id: site_id,
  #   request_context: { foo: :bar }
  # )
  #
  # So this context will be propagated to the ASN event
  def test_notification_with_predefined_request_context
    custom_request_context = { foo: :bar, baz: :qux }
    @ebay_api = Api.new site_id: 3, request_context: custom_request_context

    expected_request_context = { site_id: 3 }.merge(custom_request_context)

    Ebay::HttpMock.respond_with(@success)

    with_subscription_to_events do |events|
      @ebay_api.get_ebay_official_time

      assert_equal 1, events.size
      event_payload = events.last.last

      assert_equal expected_request_context, event_payload[:request_context]
    end
  end

  # Shows that request context can be changed
  # any time for entire client context like:
  #
  # ebay_api = Ebay::Api.new(
  #   auth_token: ebay_auth_token,
  #   site_id: site_id
  # )
  # ebay_api.request_context = { foo: :bar }
  #
  # So this context will be set for the client
  # and will propagated to the ASN event.
  def test_notification_with_changed_request_context
    custom_request_context = { foo: :bar, baz: :qux }
    @ebay_api.request_context = custom_request_context

    expected_request_context = { site_id: 3 }.merge(custom_request_context)

    Ebay::HttpMock.respond_with(@success)

    with_subscription_to_events do |events|
      @ebay_api.get_ebay_official_time

      assert_equal 1, events.size
      event_payload = events.last.last

      assert_equal expected_request_context, event_payload[:request_context]
    end
  end

  def test_notification_with_exception
    expected_exception_class = Ebay::HttpMock::NoResponseRecorded
    expected_exception_data = [expected_exception_class.to_s, 'No more responses have been recorded']

    with_subscription_to_events do |events|
      # emulate attempting to reach external API
      # which fails because of missing request mock
      # and external requests are not allowed
      assert_raise(expected_exception_class) { @ebay_api.get_ebay_official_time }

      assert_equal 1, events.size

      event_payload = events.last.last

      # response is blank as the request didn't reach eBay
      assert_equal true, event_payload[:response].blank?

      # event contains exception data
      assert_equal expected_exception_data, event_payload[:exception]
      assert_equal expected_exception_class, event_payload[:exception_object].class
      assert_equal 'No more responses have been recorded', event_payload[:exception_object].message
    end
  end

  def test_notification_api_version
    Ebay::HttpMock.respond_with(@success)
    requested_api_version = '1234'

    with_subscription_to_events do |events|
      @ebay_api.get_ebay_official_time(requested_api_version: requested_api_version)

      assert_equal 1, events.size

      assert_common_event_data(
        events.last,
        expected_api_endpoint: 'GeteBayOfficialTime',
        expected_api_version: requested_api_version
      )
    end
  end

  def test_notification_api_method
    Ebay::HttpMock.respond_with(responses(:verify_add_item))

    with_subscription_to_events do |events|
      @ebay_api.verify_add_item

      assert_equal 1, events.size

      assert_common_event_data(events.last, expected_api_endpoint: 'VerifyAddItem')
    end
  end

  private

  def with_subscription_to_events
    events = []
    subscriber = ActiveSupport::Notifications.subscribe(Api.request_event_name) do |*args|
      events << args
    end

    yield(events)

    ActiveSupport::Notifications.unsubscribe(subscriber)
  end

  def assert_common_event_data(event,
    expected_api_endpoint:,
    expected_api_version: Ebay::Schema::VERSION.to_s,
    expected_request_context: { site_id: 3 })

    _name, event_start_time, event_end_time, _id, event_payload = event

    # assert request details
    assert_equal expected_api_endpoint, event_payload[:api_endpoint]
    assert_equal expected_api_version, event_payload[:api_version]
    assert_equal :post, event_payload[:method]
    assert_equal expected_request_context, event_payload[:request_context]

    # assert event details
    assert_not_equal 0, event_end_time - event_start_time
  end

  def assert_response_in(event, expected_status: 200)
    event_payload = event.last

    assert_equal Ebay::Response, event_payload[:response].class
    assert_equal expected_status, event_payload[:response].code
  end
end
