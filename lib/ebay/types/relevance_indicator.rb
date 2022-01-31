
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  numeric_node :search_count, 'SearchCount', :optional => true
    class RelevanceIndicator
      include XML::Mapping
      include Initializer
      root_element_name 'RelevanceIndicator'
      numeric_node :search_count, 'SearchCount', :optional => true
    end
  end
end


