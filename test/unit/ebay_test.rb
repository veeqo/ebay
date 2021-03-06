require File.dirname(__FILE__) + '/../test_helper'

class EbayTest < Test::Unit::TestCase
  include Ebay
  include Ebay::Types

  def setup
    @ebay = Api.new
    @success = responses(:official_time_success)
    @failure = responses(:official_time_failure)
  end

  def test_build_header
	  header = {
	             'X-EBAY-API-COMPATIBILITY-LEVEL' => Ebay::Schema::VERSION.to_s,
	             'X-EBAY-API-SESSION-CERTIFICATE' => "#{Api.dev_id};#{Api.app_id};#{Api.cert}",
	             'X-EBAY-API-DEV-NAME' => Api.dev_id,
	             'X-EBAY-API-APP-NAME' => Api.app_id,
	             'X-EBAY-API-CERT-NAME' => Api.cert,
	             'X-EBAY-API-CALL-NAME' => 'GeteBayOfficialTime',
	             'X-EBAY-API-SITEID' => @ebay.site_id.to_s,
	             'Content-Type' => 'text/xml',
               'Accept-Encoding' => 'gzip'
	           }
    ebay = Api.new
	  assert_equal header, ebay.send(:build_headers, 'GeteBayOfficialTime')
	end

  def test_default_api_version_header
    api_version = Ebay::Schema::VERSION.to_s
    ebay = Api.new
    assert_equal api_version, ebay.send(:build_headers, 'GeteBayOfficialTime')['X-EBAY-API-COMPATIBILITY-LEVEL']
  end

  def test_redefined_api_version_header
    api_version = (Ebay::Schema::VERSION - 10)
    ebay = Api.new api_version: api_version
    assert_equal api_version.to_s, ebay.send(:build_headers, 'GeteBayOfficialTime')['X-EBAY-API-COMPATIBILITY-LEVEL']
  end

	def test_override_site_id
	  ebay = Api.new(:site_id => 2)
	  assert_equal 0, Api.site_id
	  assert_equal 2, ebay.site_id
	end

	def test_header_uses_overridden_site_id
	  ebay = Api.new(:site_id => 2)
	  headers = ebay.send(:build_headers, 'GeteBayOfficialTime')
	  assert_equal headers['X-EBAY-API-SITEID'], '2'
	end

	def test_override_auth_token
	  ebay = Api.new(:auth_token => 'OVERRIDE')
	  assert_equal 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', Api.auth_token 
	  assert_equal 'OVERRIDE', ebay.auth_token
	end

  def test_raise_on_error
    Ebay::HttpMock.respond_with(@failure)
    assert_raise(Ebay::RequestError) do
      @ebay.get_ebay_official_time
    end
  end

  def test_successful_request
    Ebay::HttpMock.respond_with(@success)
    response = @ebay.get_ebay_official_time
    assert response.success?
    assert_equal Time.parse('2006-07-05T14:23:03.399Z'), response.timestamp
  end

  def test_request_with_block
    Ebay::HttpMock.respond_with(@success)
    response = @ebay.get_ebay_official_time{ }
    assert response.success?
    assert_equal Time.parse('2006-07-05T14:23:03.399Z'), response.timestamp
  end

  def test_raise_on_error_with_errors
    Ebay::HttpMock.respond_with responses(:verify_add_item_failure)
    begin
      @ebay.verify_add_item
    rescue Ebay::RequestError => exception
      assert_equal 1, exception.errors.size
      error = exception.errors.first
      assert_equal 'Input data is invalid.', error.short_message
      assert_equal ErrorClassificationCode::RequestError, error.error_classification
    end
  end

  def test_raise_on_error_with_request_limit_exceeded_failure
    Ebay::HttpMock.respond_with responses(:verify_add_item_request_limit_exceeded_failure)
    begin
      @ebay.verify_add_item
    rescue Ebay::RequestError => exception
      assert_equal 1, exception.errors.size
      error = exception.errors.first
      assert_equal 'Your application has exceeded usage limit on this call.', error.short_message
      assert_equal 'Your application has exceeded usage limit on this call, please make call to GetAPIAccessRules to check your call usage.', error.long_message
      assert_equal ErrorClassificationCode::RequestError, error.error_classification
      assert_equal exception.class, Ebay::RequestLimitExceeded
    end
  end

  def test_force_encoding_to_default
    response_in_ascii = load_response(:local_lang_chars).force_encoding('ASCII-8BIT')
    Ebay::HttpMock.respond_with parse_response(response_in_ascii)
    order = @ebay.get_orders(order_ids: ['00000000000-11111111111']).orders.first

    assert_equal 'Jüss DÖe', order.shipping_address.name
    assert_equal 'Österreich', order.shipping_address.country_name
    assert_equal 'UTF-8', order.shipping_address.country_name.encoding.to_s
  end

  def test_extracting_non_matching_encoding
    response_in_ascii = load_response(:local_lang_chars).force_encoding('ASCII-8BIT')
    Ebay::HttpMock.respond_with parse_response(response_in_ascii, headers: { 'Content-Type' => 'text/html; charset=utf-8' })
    order = @ebay.get_orders(order_ids: ['00000000000-11111111111']).orders.first

    assert_equal 'Jüss DÖe', order.shipping_address.name
    assert_equal 'Österreich', order.shipping_address.country_name
    assert_equal 'UTF-8', order.shipping_address.country_name.encoding.to_s
  end

  def test_extracting_matching_encoding
    response_in_ascii = load_response(:local_lang_chars).force_encoding('ASCII-8BIT')
    Ebay::HttpMock.respond_with parse_response(response_in_ascii, headers: { 'Content-Type' => 'text/html; charset=ascii-8bit' })
    order = @ebay.get_orders(order_ids: ['00000000000-11111111111']).orders.first

    assert_equal 'Jüss DÖe', order.shipping_address.name
    assert_equal 'Österreich', order.shipping_address.country_name
    assert_equal 'UTF-8', order.shipping_address.country_name.encoding.to_s
  end

  def test_encoding_conversion_gzip
    response_in_ascii = load_response(:local_lang_chars).force_encoding('ASCII-8BIT')
    compressed = Zlib.gzip(response_in_ascii)

    Ebay::HttpMock.respond_with parse_response(compressed, headers: { 'Content-Encoding' => 'gzip' })
    order = @ebay.get_orders(order_ids: ['00000000000-11111111111']).orders.first

    assert_equal 'Jüss DÖe', order.shipping_address.name
    assert_equal 'Österreich', order.shipping_address.country_name
    assert_equal 'UTF-8', order.shipping_address.country_name.encoding.to_s
  end

  def test_unknown_request_raises_no_method_error
    assert_raise(NoMethodError) do
      @ebay.get_sushi
    end
  end
end
