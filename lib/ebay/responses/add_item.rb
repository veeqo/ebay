require 'ebay/types/fee'
require 'ebay/types/product_suggestion'

module Ebay # :nodoc:
  module Responses # :nodoc:
    # == Attributes
    #  text_node :item_id, 'ItemID', :optional => true
    #  date_time_node :start_time, 'StartTime', :optional => true
    #  date_time_node :end_time, 'EndTime', :optional => true
    #  array_node :fees, 'Fees', 'Fee', :class => Fee, :default_value => []
    #  text_node :category_id, 'CategoryID', :optional => true
    #  text_node :category2_id, 'Category2ID', :optional => true
    #  value_array_node :discount_reasons, 'DiscountReason', :default_value => []
    #  array_node :product_suggestions, 'ProductSuggestions', 'ProductSuggestion', :class => ProductSuggestion, :default_value => []
    class AddItem < Abstract
      include XML::Mapping
      include Initializer
      root_element_name 'AddItemResponse'
      text_node :item_id, 'ItemID', :optional => true
      date_time_node :start_time, 'StartTime', :optional => true
      date_time_node :end_time, 'EndTime', :optional => true
      array_node :fees, 'Fees', 'Fee', :class => Fee, :default_value => []
      text_node :category_id, 'CategoryID', :optional => true
      text_node :category2_id, 'Category2ID', :optional => true
      value_array_node :discount_reasons, 'DiscountReason', :default_value => []
      array_node :product_suggestions, 'ProductSuggestions', 'ProductSuggestion', :class => ProductSuggestion, :default_value => []
    end
  end
end


