require File.dirname(__FILE__) + '/../test_helper'

class StorefrontTest < Test::Unit::TestCase
  def test_round_trip_with_primary_category_only
    assert_round_trip(
      '<Storefront><StoreCategoryID>100</StoreCategoryID></Storefront>',
      primary_id: 100,
      secondary_id: nil
    )
  end

  def test_round_trip_with_secondary_category_only
    assert_round_trip(
      '<Storefront><StoreCategory2ID>200</StoreCategory2ID></Storefront>',
      primary_id: nil,
      secondary_id: 200
    )
  end

  def test_round_trip_with_both_categories
    assert_round_trip(
      '<Storefront><StoreCategoryID>100</StoreCategoryID><StoreCategory2ID>200</StoreCategory2ID></Storefront>',
      primary_id: 100,
      secondary_id: 200
    )
  end

  def test_round_trip_without_categories
    assert_round_trip(
      '<Storefront/>',
      primary_id: nil,
      secondary_id: nil
    )
  end

  private

  def assert_round_trip(expected_xml, primary_id:, secondary_id:)
    storefront = Ebay::Types::Storefront.new
    storefront.store_category_id = primary_id
    storefront.store_category2_id = secondary_id

    xml = storefront.save_to_xml.to_s
    parsed_storefront = Ebay::Types::Storefront.load_from_xml(REXML::Document.new(xml).root)

    assert_equal expected_xml, xml
    assert_equal primary_id, parsed_storefront.store_category_id
    assert_equal secondary_id, parsed_storefront.store_category2_id
  end
end
