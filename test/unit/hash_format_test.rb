require File.dirname(__FILE__) + '/../test_helper'

# The :hash format must detect errors identically to the default :object format,
# because it reuses Ebay::ResponseHandler over the same mapped Ebay::Types::Error
# objects. Each case parses a fixture both ways and asserts the same outcome.
class HashFormatTest < Test::Unit::TestCase
  def setup
    @api = Ebay::Api.new
  end

  def test_success_does_not_raise_either_way
    assert_same_outcome(:official_time_success)
    assert_equal :no_raise, outcome(load_response(:official_time_success), :hash)[:raised]
  end

  def test_generic_failure_raises_request_error
    assert_same_outcome(:official_time_failure)
    assert_raise(Ebay::RequestError) { @api.send(:parse, load_response(:official_time_failure), :hash) }
  end

  def test_item_not_accessible
    assert_same_outcome(:get_item_with_item_not_accessible)
    assert_raise(Ebay::ItemNotAccessible) do
      @api.send(:parse, load_response(:get_item_with_item_not_accessible), :hash)
    end
  end

  def test_request_limit_exceeded
    assert_same_outcome(:verify_add_item_request_limit_exceeded_failure)
    assert_raise(Ebay::RequestLimitExceeded) do
      @api.send(:parse, load_response(:verify_add_item_request_limit_exceeded_failure), :hash)
    end
  end

  # Two errors, code 17 (ItemNotAccessible) and 518 (RequestLimitExceeded). The
  # 518 check has priority in ResponseHandler, so both formats must raise
  # RequestLimitExceeded -- and every error must survive the parse, not just the
  # last one.
  def test_multiple_failures_preserves_all_errors_and_priority
    assert_same_outcome(:get_item_with_multiple_failures)
    raw = load_response(:get_item_with_multiple_failures)
    assert_raise(Ebay::RequestLimitExceeded) { @api.send(:parse, raw, :hash) }

    response = Ebay::ParseToHashResponse.call(raw)
    assert_equal %w[17 518], response.errors.map(&:error_code)
  end

  # ResponseHandler switches on #ack, so it has to come back with the same value
  # the mapped response carries -- the predicates below are derived from it.
  def test_ack_matches_the_object_format
    {
      official_time_success => 'Success',
      official_time_warning => 'Warning',
      official_time_failure => 'Failure'
    }.each do |raw, expected|
      assert_equal expected, Ebay::ParseToHashResponse.call(raw).ack
      assert_equal ack_of_mapped(raw), Ebay::ParseToHashResponse.call(raw).ack
    end
  end

  def test_hash_response_predicates
    ok = Ebay::ParseToHashResponse.call(load_response(:official_time_success))
    assert_equal 'Success', ok.ack
    assert ok.success?
    assert !ok.failure?
    assert !ok.warning?
    assert !ok.errors?

    bad = Ebay::ParseToHashResponse.call(load_response(:official_time_failure))
    assert_equal 'Failure', bad.ack
    assert bad.failure?
    assert !bad.success?
    assert bad.errors?
  end

  def test_invalid_input_failure_raises_request_error
    assert_same_outcome(:verify_add_item_failure)
    assert_raise(Ebay::RequestError) { @api.send(:parse, load_response(:verify_add_item_failure), :hash) }
  end

  # Ack 'Warning' carries errors but is not a failure, so ResponseHandler must let
  # it through. This is the case most likely to regress into a spurious raise.
  def test_warning_carries_errors_without_raising
    assert_same_outcome(:official_time_warning)

    raw = load_response(:official_time_warning)
    response = @api.send(:parse, raw, :hash)

    assert response.warning?
    assert !response.failure?
    assert_equal 2, response.errors.size
    assert_equal %w[21927 21927], response.errors.map(&:error_code)
  end

  # The error message the caller sees is built from the errors, so a format that
  # dropped or reordered them would still raise the right class with the wrong
  # text. Pin the message rather than trusting the class alone.
  def test_raised_message_matches_the_object_format
    raw = load_response(:get_item_with_multiple_failures)

    object_message = outcome(raw, :object)[:message]
    hash_message = outcome(raw, :hash)[:message]

    assert !object_message.to_s.empty?, 'the fixture should produce a message'
    assert_equal object_message, hash_message
    assert_match(/cannot be accessed/, hash_message)
    assert_match(/exceeded usage limit/, hash_message)
  end

  # An element present but empty reads as nil in both formats, the same as one
  # that was absent -- so a caller cannot tell the formats apart by it.
  def test_empty_elements_read_as_nil_in_both_formats
    item = '<Item><ItemID>1</ItemID><SKU></SKU><Title/><Quantity></Quantity></Item>'

    mapped = Ebay::Types::Item.load_from_xml(REXML::Document.new(item).root)
    hash = hash_item(item)

    assert_nil mapped.sku
    assert_nil hash['SKU']

    assert_nil mapped.title
    assert_nil hash['Title']

    assert_nil mapped.quantity
    assert_nil hash['Quantity']
  end

  def test_empty_quantities_coerce_the_same_in_both_formats
    item = '<Item><ItemID>1</ItemID><Quantity></Quantity>' \
           '<SellingStatus><QuantitySold></QuantitySold></SellingStatus></Item>'

    mapped = Ebay::Types::Item.load_from_xml(REXML::Document.new(item).root)
    hash = hash_item(item)

    mapped_available = mapped.quantity.to_i - mapped.selling_status.quantity_sold.to_i
    hash_available = hash['Quantity'].to_i - (hash['SellingStatus'] || {})['QuantitySold'].to_i

    assert_equal 0, mapped_available
    assert_equal mapped_available, hash_available
  end

  # <SellingStatus/> is an empty container rather than an empty value, but the
  # document cannot say so. nil lets the caller treat it as either, where a String
  # would raise on the very next read.
  def test_empty_container_does_not_break_reading_through_it
    hash = hash_item('<Item><ItemID>1</ItemID><SellingStatus></SellingStatus></Item>')

    assert_nil hash['SellingStatus']
    assert_nil (hash['SellingStatus'] || {})['QuantitySold']

    mapped = Ebay::Types::Item.load_from_xml(
      REXML::Document.new('<Item><ItemID>1</ItemID><SellingStatus></SellingStatus></Item>').root
    )
    assert_nil mapped.selling_status.quantity_sold
  end

  def test_unknown_format_still_raises
    assert_raise(ArgumentError) { @api.send(:parse, load_response(:official_time_success), :bogus) }
  end

  # The payload is reachable and holds the data the response carried.
  def test_payload_is_readable
    response = @api.send(:parse, load_response(:verify_add_item), :hash)
    assert_equal '0', response['ItemID']
    fees = response['Fees']['Fee']
    assert_instance_of Array, fees
    insertion = fees.find { |f| f['Name'] == 'InsertionFee' }
    assert_equal 'USD', insertion['Fee']['currencyID']
    assert_equal '0.35', insertion['Fee']['__text']
  end

  private

  def outcome(raw, format)
    @api.send(:parse, raw, format)
    { raised: :no_raise }
  rescue StandardError => e
    {
      raised: e.class,
      message: e.message,
      error_codes: e.respond_to?(:errors) ? e.errors.map(&:error_code) : nil
    }
  end

  def assert_same_outcome(fixture)
    raw = load_response(fixture)
    assert_equal outcome(raw, :object), outcome(raw, :hash),
                 "#{fixture}: :hash outcome differs from :object"
  end

  # The ack the ':object' format reports, read without ResponseHandler so a
  # failing response can be inspected rather than raising.
  def ack_of_mapped(raw)
    XML::Mapping.load_object_from_xml(REXML::Document.new(raw).root).ack
  end

  def hash_item(item_xml)
    Ebay::ParseToHashResponse.call(
      "<GetSellerEventsResponse><Ack>Success</Ack><ItemArray>#{item_xml}</ItemArray></GetSellerEventsResponse>"
    ).body.dig('ItemArray', 'Item')
  end

  def official_time_success
    load_response(:official_time_success)
  end

  def official_time_warning
    load_response(:official_time_warning)
  end

  def official_time_failure
    load_response(:official_time_failure)
  end
end
