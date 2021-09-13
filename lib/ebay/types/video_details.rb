
module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :video_id, 'VideoID', :optional => true
    class VideoDetails
      include XML::Mapping
      include Initializer
      root_element_name 'VideoDetails'
      text_node :video_id, 'VideoID', :optional => true
    end
  end
end


