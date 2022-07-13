require 'ebay/types/picture_ur_ls'

module Ebay # :nodoc:
  module Types # :nodoc:
    # == Attributes
    #  text_node :variation_specific_value, 'VariationSpecificValue', :optional => true
    #  text_node :picture_url, 'PictureURL', :optional => true
    #  text_node :gallery_url, 'GalleryURL', :optional => true
    #  text_node :external_picture_url, 'ExternalPictureURL', :optional => true
    #  array_node :extended_picture_details, 'ExtendedPictureDetails', 'PictureURLs', :class => PictureURLs, :default_value => []
    class VariationSpecificPictureSet
      include XML::Mapping
      include Initializer
      root_element_name 'VariationSpecificPictureSet'
      text_node :variation_specific_value, 'VariationSpecificValue', :optional => true
      # eBay returns multiple nodes with the same PictureURL tag,
      # so 'picture_urls' has been introduced to parse them correctly.
      value_array_node :picture_urls, 'PictureURL', :default_value => [], :optional => true
      text_node :picture_url, 'PictureURL', :optional => true
      text_node :gallery_url, 'GalleryURL', :optional => true
      text_node :external_picture_url, 'ExternalPictureURL', :optional => true
      array_node :extended_picture_details, 'ExtendedPictureDetails', 'PictureURLs', :class => PictureURLs, :default_value => []
    end
  end
end


