# frozen_string_literal: true

module BeyondApi
  class Error < StandardError
    attr_reader :response

    def initialize(data, status_code = nil)
      data ||= {}

      @error_id          = data["errorId"]
      @details           = data["details"]
      @trace_id          = data["traceId"]
      @error             = data["error"]
      @error_description = data["error_description"]
      @full_message      = data
      @status_code       = status_code

      super
    end
  end
end
