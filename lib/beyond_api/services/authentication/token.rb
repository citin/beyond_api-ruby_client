module BeyondApi
  module Authentication
    class Token
      include Concerns::Connection # @session, @authorization

      def initialize(session = nil)
        @session = session
        @authorization = :basic
      end

      def refresh(refresh_token)
        post("oauth/token", {}, { grant_type: "refresh_token", refresh_token: })
      end

      def get(code)
        post("oauth/token", {}, { grant_type: "authorization_code" , code: })
      end

      def client_credentials
        post("oauth/token", {}, { grant_type: "client_credentials" })
      end
    end
  end
end
