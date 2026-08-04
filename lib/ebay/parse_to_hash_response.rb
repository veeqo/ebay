require 'ebay/hash_response'

module Ebay #:nodoc:
  # Parses a response into plain hashes instead of mapped objects, for calls whose
  # responses are large enough that the mapped objects dominate memory.
  #
  # xml-mapping declares an optional node as ':default_value => nil' and assigns
  # that default eagerly, so a mapped object carries an instance variable for every
  # node it declares no matter how sparse the response was. Ebay::Types::Item
  # declares about 140 of them, so 3000 items from a GetSellerEvents call carrying
  # six fields each still build 420,000 instance variables, most of them nil.
  # Parsing into hashes keeps only the elements eBay actually sent.
  #
  # <Ack> and <Errors> are deliberately still parsed with the real
  # Ebay::Types::Error mapping: they are shallow and usually absent, so they cost
  # nothing, and keeping them means Ebay::ResponseHandler raises exactly the same
  # exceptions as the ':object' format.
  #
  # == Arity
  # A child element becomes an Array only when it actually appears more than once
  # inside its parent. A parent with a single <Item> therefore exposes a Hash,
  # while one with several exposes an Array. This mirrors the document rather than
  # the schema, so callers iterating a list that may hold one element should wrap
  # the access: Array(response['ItemArray']['Item']).
  #
  # == Empty elements
  # An element carrying no text and no children is nil, whether it is an empty
  # value (<SKU/>) or an empty container (<SellingStatus/>) -- the document alone
  # does not say which, and this parser deliberately holds no schema knowledge to
  # tell them apart. Callers that know what an element should be can treat nil as
  # either, e.g. 'Array(value)', 'value.to_i' or 'value || {}', and this matches
  # how the ':object' format reports an element it found nothing in.
  class ParseToHashResponse
    # Elements consumed by the error path, so they are not repeated in the body.
    ERROR_ELEMENTS = %w[Errors].freeze

    # The key under which an element's own text is stored when the element also
    # carries attributes (e.g. a monetary value with a currencyID).
    TEXT_KEY = '__text'.freeze

    def self.call(content)
      new(content).call
    end

    def initialize(content)
      @content = content
    end

    def call
      root = REXML::Document.new(content).root
      # An empty body has no root. The :object format raises from
      # load_object_from_xml here, so raise rather than return a blank response.
      raise Ebay::EbayError, 'The response body is empty' if root.nil?

      # Errors are matched by XPath, so they are always collected regardless of how
      # many there are -- the error handling never depends on the body's arity.
      errors = REXML::XPath.match(root, 'Errors').map do |element|
        Ebay::Types::Error.load_from_xml(element)
      end

      ack = REXML::XPath.first(root, 'Ack')

      body = {}
      root.elements.each do |element|
        next if ERROR_ELEMENTS.include?(element.name)

        store(body, element.name, to_hash(element))
      end

      Ebay::HashResponse.new(ack: ack && ack.text, errors: errors, body: body)
    end

    private

    attr_reader :content

    # Converts an element into a String, or a Hash of its children.
    def to_hash(element)
      children = element.elements.to_a

      return leaf_value(element) if children.empty?

      result = {}
      children.each { |child| store(result, child.name, to_hash(child)) }
      # Attributes of a container element, e.g. ParamID on <ErrorParameters>. A
      # child element of the same name wins, since that is the actual data.
      element.attributes.each_attribute { |attr| result[attr.name] ||= attr.value }
      result
    end

    # An element with no children is its text, and an element carrying no text at
    # all is nil.
    #
    # Returning nil rather than '' keeps this parser free of any knowledge of the
    # schema. A childless, textless element is ambiguous in the document alone --
    # <SKU/> is an empty value while <SellingStatus/> is an empty container -- and
    # only the caller knows which. nil lets a caller treat it as either without a
    # type check, and matches how the ':object' format reports an element it found
    # nothing in.
    #
    # When the element carries attributes -- a money node's currencyID, a rental
    # price's duration -- they would otherwise be lost, so it becomes a Hash with
    # the text, if any, under TEXT_KEY.
    def leaf_value(element)
      text = element.texts.map(&:value).join

      return text.empty? ? nil : text if element.attributes.empty?

      result = {}
      result[TEXT_KEY] = text unless text.empty?
      element.attributes.each_attribute { |attr| result[attr.name] = attr.value }
      result
    end

    # Stores a value, accumulating repeated element names into an Array.
    #
    # A plain 'hash[name] = value' would silently keep only the last occurrence of
    # a repeated element -- losing all but the last <Item> of an ItemArray.
    def store(hash, name, value)
      if hash.key?(name)
        hash[name] = [hash[name]] unless hash[name].is_a?(Array)
        hash[name] << value
      else
        hash[name] = value
      end
    end
  end
end
