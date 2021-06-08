
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :fulfillment_by, 'FulfillmentBy', :optional => true
    #  text_node :fulfillment_ref_id, 'FulfillmentRefId', :optional => true
    class Fulfillment
      include XML::Mapping
      include Initializer
      root_element_name 'Fulfillment'
      text_node :fulfillment_by, 'FulfillmentBy', :optional => true
      text_node :fulfillment_ref_id, 'FulfillmentRefId', :optional => true
    end
  end
end


