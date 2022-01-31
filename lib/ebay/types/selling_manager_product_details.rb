
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :product_name, 'ProductName', :optional => true
    class SellingManagerProductDetails
      include XML::Mapping
      include Initializer
      root_element_name 'SellingManagerProductDetails'
      text_node :product_name, 'ProductName', :optional => true
    end
  end
end


