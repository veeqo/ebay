require File.dirname(__FILE__) + '/../test_helper'

class HttpMockTest < Test::Unit::TestCase
  include Ebay
  include Ebay::Types

  def setup
    @ebay_api = Api.new
  end

  def test_exception_on_no_response_recorded
    assert_raise(Ebay::HttpMock::NoResponseRecorded) { @ebay_api.get_ebay_official_time }
  end

  def test_response_when_recorded
    recorded_response = responses(:official_time_success)
    Ebay::HttpMock.respond_with(recorded_response)

    response = @ebay_api.get_ebay_official_time

    expected_timestamp = recorded_response.body.match("<Timestamp>?(.*)</Timestamp>")[1].to_time.utc.iso8601

    assert_equal expected_timestamp, response.timestamp.iso8601
  end
end
