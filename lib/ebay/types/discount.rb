
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :discount_type, 'DiscountType', :optional => true
    #  money_node :amount, 'Amount', :optional => true
    class Discount
      include XML::Mapping
      include Initializer
      root_element_name 'Discount'
      text_node :discount_type, 'DiscountType', :optional => true
      money_node :amount, 'Amount', :optional => true
    end
  end
end


