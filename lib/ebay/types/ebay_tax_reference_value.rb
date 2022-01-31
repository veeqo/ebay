
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :ebay_tax_reference_value, '', :optional => true
    #  text_node :string, '@name', :optional => true
    class EBayTaxReferenceValue
      include XML::Mapping
      include Initializer
      root_element_name 'EBayTaxReferenceValue'
      text_node :ebay_tax_reference_value, '', :optional => true
      text_node :string, '@name', :optional => true
    end
  end
end


