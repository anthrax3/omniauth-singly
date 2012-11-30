require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Singly < OmniAuth::Strategies::OAuth2
      PASSTHROUGHS = %w[
        access_token
        account
        scope
        service
      ]

      option :name, "singly"

      option :client_options, {
        :site => "https://api.singly.com",
        :authorize_url => "https://api.singly.com/oauth/authenticate",
        :token_url => "https://api.singly.com/oauth/access_token"
      }

      def authorize_params
        super.tap do |params|
          PASSTHROUGHS.each do |p|
            params[p.to_sym] = request.params[p] if request.params[p]
          end
        end
      end

      uid { raw_info["id"] }

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          access_token.get("/profiles").parsed
        end
      end
    end
  end
end
