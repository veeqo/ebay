module Ebay #:nodoc:
  # A response parsed into plain hashes rather than mapped objects.
  #
  # Returned by Ebay::Api calls made with ':format => :hash'. The payload is a
  # nested Hash of Strings, Arrays and Hashes keyed by eBay's element names, while
  # #ack and #errors are parsed with the real Ebay::Types::Error mapping so error
  # detection stays identical to the ':object' format -- Ebay::ResponseHandler
  # raises the same RequestLimitExceeded / ItemNotAccessible / RequestError, and
  # the predicates below behave the same as Ebay::Responses::Base.
  #
  # The payload is reached with #[] or #body, using eBay's element names:
  #
  #   response = api.get_seller_events(..., :format => :hash)
  #   response['ItemArray']['Item'].each { |item| item['ItemID'] }
  #
  # Values are always Strings -- the ':hash' format does no type coercion, so
  # unlike the mapped objects a Quantity is "2" rather than 2, and a Timestamp is
  # a String rather than a Time.
  class HashResponse
    # The parsed payload, excluding the elements consumed by the error path.
    attr_reader :body

    # Contents of <Ack>, e.g. 'Success' or 'Failure'.
    attr_reader :ack

    # Array of Ebay::Types::Error, mapped exactly as the :object format maps them.
    attr_reader :errors

    def initialize(ack:, errors:, body:)
      @ack = ack
      @errors = errors
      @body = body
    end

    # Reads a top-level element of the payload by its eBay element name.
    def [](key)
      body[key]
    end

    def errors?
      errors.size > 0
    end

    def success?
      ack == Ebay::Types::AckCode::Success
    end

    def warning?
      ack == Ebay::Types::AckCode::Warning
    end

    def failure?
      ack == Ebay::Types::AckCode::Failure
    end

    def partial_failure?
      ack == Ebay::Types::AckCode::PartialFailure
    end

    def inspect
      "#<#{self.class.name} ack=#{ack.inspect} errors=#{errors.size} body=#{body.keys.inspect}>"
    end
  end
end
