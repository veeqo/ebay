require 'ebay/types/authenticity_verification'
require 'ebay/types/fulfillment'

module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  object_node :authenticity_verification, 'AuthenticityVerification', :class => AuthenticityVerification, :optional => true
    #  object_node :fulfillment, 'Fulfillment', :class => Fulfillment, :optional => true
    class TransactionProgram
      include XML::Mapping
      include Initializer
      root_element_name 'TransactionProgram'
      object_node :authenticity_verification, 'AuthenticityVerification', :class => AuthenticityVerification, :optional => true
      object_node :fulfillment, 'Fulfillment', :class => Fulfillment, :optional => true
    end
  end
end


