require 'ebay/types/order'
require 'ebay/types/error'

module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  array_node :orders, 'Order', :class => Order, :default_value => []
    #  array_node :errors, 'Errors', :class => Error, :default_value => []
    class OrderArray
      include XML::Mapping
      include Initializer
      root_element_name 'OrderArray'
      array_node :orders, 'Order', :class => Order, :default_value => []
      array_node :errors, 'Errors', :class => Error, :default_value => []
    end
  end
end


