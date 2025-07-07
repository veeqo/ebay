# frozen_string_literal: true

module Ebay #:nodoc:
  class ResponseHandler
    # Error codes explained:
    # https://developer.ebay.com/devzone/xml/docs/Reference/ebay/Errors/errormessages.htm
    ERROR_CODES = [
      (REQUEST_LIMIT_EXCEEDED = '518').freeze,
      (ITEM_NOT_ACCESSIBLE = '17').freeze
    ].freeze

    def initialize(response)
      @response = response
    end
    attr_reader :response

    def call
      case response.ack
      when Ebay::Types::AckCode::Failure, Ebay::Types::AckCode::PartialFailure
        # The check for request limit error has highest priority
        raise RequestLimitExceeded.new(response.errors) if request_limit_exceeded?
        raise ItemNotAccessible.new(response.errors) if item_not_accessible?

        raise RequestError.new(response.errors)
      end

      response
    end

    private

    def request_limit_exceeded?
      response.errors.any? { |error| error.error_code.to_s == REQUEST_LIMIT_EXCEEDED }
    end

    def item_not_accessible?
      response.errors.any? { |error| error.error_code.to_s == ITEM_NOT_ACCESSIBLE }
    end
  end
end
