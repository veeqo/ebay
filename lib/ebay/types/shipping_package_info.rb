
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :store_id, 'StoreID', :optional => true
    #  text_node :shipping_tracking_event, 'ShippingTrackingEvent', :optional => true
    #  date_time_node :scheduled_delivery_time_min, 'ScheduledDeliveryTimeMin', :optional => true
    #  date_time_node :scheduled_delivery_time_max, 'ScheduledDeliveryTimeMax', :optional => true
    #  date_time_node :actual_delivery_time, 'ActualDeliveryTime', :optional => true
    #  date_time_node :estimated_delivery_time_min, 'EstimatedDeliveryTimeMin', :optional => true
    #  date_time_node :estimated_delivery_time_max, 'EstimatedDeliveryTimeMax', :optional => true
    #  date_time_node :handle_by_time, 'HandleByTime', :optional => true
    #  date_time_node :min_native_estimated_delivery_time, 'MinNativeEstimatedDeliveryTime', :optional => true
    #  date_time_node :max_native_estimated_delivery_time, 'MaxNativeEstimatedDeliveryTime', :optional => true
    class ShippingPackageInfo
      include XML::Mapping
      include Initializer
      root_element_name 'ShippingPackageInfo'
      text_node :store_id, 'StoreID', :optional => true
      text_node :shipping_tracking_event, 'ShippingTrackingEvent', :optional => true
      date_time_node :scheduled_delivery_time_min, 'ScheduledDeliveryTimeMin', :optional => true
      date_time_node :scheduled_delivery_time_max, 'ScheduledDeliveryTimeMax', :optional => true
      date_time_node :actual_delivery_time, 'ActualDeliveryTime', :optional => true
      date_time_node :estimated_delivery_time_min, 'EstimatedDeliveryTimeMin', :optional => true
      date_time_node :estimated_delivery_time_max, 'EstimatedDeliveryTimeMax', :optional => true
      date_time_node :handle_by_time, 'HandleByTime', :optional => true
      date_time_node :min_native_estimated_delivery_time, 'MinNativeEstimatedDeliveryTime', :optional => true
      date_time_node :max_native_estimated_delivery_time, 'MaxNativeEstimatedDeliveryTime', :optional => true
    end
  end
end


