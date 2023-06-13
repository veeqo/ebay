# frozen_string_literal: true

module Ebay #:nodoc:
  class ResponseHandler
    # Error codes explained:
    # https://developer.ebay.com/devzone/xml/docs/Reference/ebay/Errors/errormessages.htm
    ERROR_CODES = [
      (REQUEST_LIMIT_EXCEEDED = '518').freeze
    ].freeze

    def initialize(response)
      @response = response
    end
    attr_reader :response

    def call
      case response.ack
      when Ebay::Types::AckCode::Failure, Ebay::Types::AckCode::PartialFailure
        if request_limit_exceeded?(response.errors)
          raise RequestLimitExceeded.new(response.errors)
        else
          raise RequestError.new(response.errors)
        end
      end

      response
    end

    private

    def request_limit_exceeded?(errors)
      errors.any? { |error| error.error_code.to_s == REQUEST_LIMIT_EXCEEDED }
    end
  end
end
