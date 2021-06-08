
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :status, 'Status', :optional => true
    #  text_node :outcome_reason, 'OutcomeReason', :optional => true
    class AuthenticityVerification
      include XML::Mapping
      include Initializer
      root_element_name 'AuthenticityVerification'
      text_node :status, 'Status', :optional => true
      text_node :outcome_reason, 'OutcomeReason', :optional => true
    end
  end
end


