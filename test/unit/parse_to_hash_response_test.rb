require File.dirname(__FILE__) + '/../test_helper'

class ParseToHashResponseTest < Test::Unit::TestCase
  include Ebay

  # --- structure -----------------------------------------------------------

  def test_returns_a_hash_response
    r = parse('<GetItemResponse><Ack>Success</Ack></GetItemResponse>')
    assert_instance_of HashResponse, r
    assert_equal 'Success', r.ack
  end

  def test_nested_elements_become_nested_hashes
    r = parse('<R><Item><ItemID>1</ItemID></Item></R>')
    assert_equal({ 'ItemID' => '1' }, r['Item'])
  end

  def test_leaf_text_is_a_string
    r = parse('<R><ItemID>42</ItemID></R>')
    assert_equal '42', r['ItemID']
  end

  # --- repeated elements accumulate into an array -------------------

  def test_repeated_elements_become_an_array
    r = parse('<R><ItemArray><Item><ItemID>1</ItemID></Item>' \
              '<Item><ItemID>2</ItemID></Item>' \
              '<Item><ItemID>3</ItemID></Item></ItemArray></R>')
    items = r['ItemArray']['Item']
    assert_instance_of Array, items
    assert_equal %w[1 2 3], items.map { |i| i['ItemID'] }
  end

  def test_single_element_is_not_an_array
    r = parse('<R><ItemArray><Item><ItemID>1</ItemID></Item></ItemArray></R>')
    assert_instance_of Hash, r['ItemArray']['Item']
  end

  def test_repeated_variation_specifics_are_all_kept
    r = parse('<R><VariationSpecifics>' \
              '<NameValueList><Name>Colour</Name><Value>Red</Value></NameValueList>' \
              '<NameValueList><Name>Size</Name><Value>L</Value></NameValueList>' \
              '</VariationSpecifics></R>')
    pairs = r['VariationSpecifics']['NameValueList'].map { |nv| [nv['Name'], nv['Value']] }
    assert_equal [%w[Colour Red], %w[Size L]], pairs
  end

  # --- element attributes are preserved -----------------------------

  def test_attributes_on_a_leaf_are_kept_with_text
    r = parse('<R><StartPrice currencyID="USD">10.00</StartPrice></R>')
    assert_equal({ '__text' => '10.00', 'currencyID' => 'USD' }, r['StartPrice'])
  end

  def test_attributes_on_a_container_are_kept
    r = parse('<R><ErrorParameters ParamID="0"><Value>123</Value></ErrorParameters></R>')
    assert_equal '0', r['ErrorParameters']['ParamID']
    assert_equal '123', r['ErrorParameters']['Value']
  end

  def test_child_element_wins_over_same_named_attribute
    r = parse('<R><Fee Name="x"><Name>real</Name></Fee></R>')
    assert_equal 'real', r['Fee']['Name']
  end

  # --- empty elements -----------------------------------------------
  #
  # An element with no text and no children is nil. The document alone cannot say
  # whether it is an empty value or an empty container, and this parser holds no
  # schema knowledge to decide -- nil lets the caller treat it as either.

  def test_empty_element_is_nil
    assert_nil parse('<R><SKU></SKU></R>')['SKU']
  end

  def test_self_closed_element_is_nil
    assert_nil parse('<R><SKU/></R>')['SKU']
  end

  def test_absent_element_is_nil
    assert_nil parse('<R><SKU>x</SKU></R>')['Title']
  end

  # An empty container must not come back as a String, or reading a key off it
  # would raise instead of answering nil.
  def test_empty_container_is_nil_so_it_can_be_treated_as_a_hash
    value = parse('<R><SellingStatus></SellingStatus></R>')['SellingStatus']

    assert_nil value
    assert_equal({}, value || {})
    assert_nil (value || {})['QuantitySold']
  end

  def test_whitespace_only_element_keeps_its_text
    assert_equal ' ', parse('<R><SKU> </SKU></R>')['SKU']
  end

  # Attributes still win over emptiness, so a money node's currency survives even
  # when the amount is blank.
  def test_empty_element_with_attributes_keeps_the_attributes
    assert_equal({ 'currencyID' => 'USD' }, parse('<R><StartPrice currencyID="USD"></StartPrice></R>')['StartPrice'])
  end

  # --- empty body ----------------------------------------------------------

  def test_empty_body_raises
    assert_raise(Ebay::EbayError) { parse('') }
  end

  # --- errors --------------------------------------------------------------
  #
  # <Errors> keeps going through the real Ebay::Types::Error mapping, so that
  # Ebay::ResponseHandler raises the same exceptions as the :object format.

  def test_no_errors_gives_an_empty_collection
    r = parse('<GetItemResponse><Ack>Success</Ack></GetItemResponse>')
    assert_equal [], r.errors
    assert_equal false, r.errors?
    assert_equal true, r.success?
  end

  def test_error_is_mapped_to_the_real_error_type
    r = parse(failure_xml(single_error))

    assert_equal 1, r.errors.size
    assert_instance_of Ebay::Types::Error, r.errors.first
  end

  def test_error_fields_the_response_handler_reads
    error = parse(failure_xml(single_error)).errors.first

    assert_equal '17', error.error_code
    assert_equal 'This item cannot be accessed.', error.long_message
    assert_equal "Item can't be accessed.", error.short_message
    assert_equal 'Error', error.severity_code
    assert_equal 'RequestError', error.error_classification
  end

  def test_error_predicates_follow_the_ack
    r = parse(failure_xml(single_error))

    assert_equal true, r.errors?
    assert_equal true, r.failure?
    assert_equal false, r.success?
    assert_equal 'Failure', r.ack
  end

  def test_every_repeated_error_is_kept
    second_error = '<Errors>' \
                   '<LongMessage>Usage limit exceeded.</LongMessage>' \
                   '<ErrorCode>518</ErrorCode>' \
                   '</Errors>'

    r = parse(failure_xml(single_error + second_error))

    assert_equal 2, r.errors.size
    assert_equal %w[17 518], r.errors.map(&:error_code)
  end

  # Arity of the body never affects error collection: a lone <Errors> still
  # yields a one-element Array rather than a bare object.
  def test_single_error_is_still_a_collection
    assert_instance_of Array, parse(failure_xml(single_error)).errors
  end

  def test_error_parameters_are_mapped
    errors = '<Errors><ErrorCode>17</ErrorCode>' \
             '<ErrorParameters ParamID="0"><Value>123456789</Value></ErrorParameters>' \
             '</Errors>'

    error = parse(failure_xml(errors)).errors.first

    assert_equal 1, error.error_parameters.size
    assert_equal '123456789', error.error_parameters.first.value
  end

  # The errors are consumed by the error path, so they must not also show up in
  # the payload -- otherwise every caller would carry a second copy of them.
  def test_errors_are_not_duplicated_into_the_body
    r = parse(failure_xml(single_error))

    assert_nil r['Errors']
    assert_equal false, r.body.key?('Errors')
  end

  def test_body_still_holds_the_payload_of_a_failed_response
    r = parse("<GetItemResponse><Ack>Failure</Ack>#{single_error}<Build>e123</Build></GetItemResponse>")

    assert_equal 'e123', r['Build']
    assert_equal 1, r.errors.size
  end

  # A warning carries errors while still succeeding, so the two are independent.
  def test_warning_keeps_its_errors
    r = parse("<GetItemResponse><Ack>Warning</Ack>#{single_error}</GetItemResponse>")

    assert_equal true, r.warning?
    assert_equal false, r.failure?
    assert_equal true, r.errors?
  end

  private

  def parse(xml)
    ParseToHashResponse.call(xml)
  end

  def failure_xml(errors)
    "<GetItemResponse><Ack>Failure</Ack>#{errors}</GetItemResponse>"
  end

  def single_error
    '<Errors>' \
      '<ShortMessage>Item can&apos;t be accessed.</ShortMessage>' \
      '<LongMessage>This item cannot be accessed.</LongMessage>' \
      '<ErrorCode>17</ErrorCode>' \
      '<SeverityCode>Error</SeverityCode>' \
      '<ErrorClassification>RequestError</ErrorClassification>' \
      '</Errors>'
  end
end
