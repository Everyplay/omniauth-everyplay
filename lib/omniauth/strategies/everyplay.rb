require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Everyplay < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'basic'

      option :name, "everyplay"

      option :client_options, {
        :site => 'https://api.everyplay.com',
        :authorize_url => 'https://everyplay.com/connect',
        :token_url => '/oauth2/access_token'
      }

      option :access_token_options, {
        :header_format => 'Bearer %s',
        :param_name => 'access_token'
      }


      uid { raw_info['id'] }

      info do
        prune!({
          'nickname' => raw_info['username'],
          'name' => raw_info['username'],
          'image' => raw_info['avatar_url']
        })
      end

      credentials do
        prune!({
          'expires' => access_token.expires?,
          'expires_at' => access_token.expires_at
        })
      end

      extra do
        prune!({
          'raw_info' => raw_info
        })
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end

      def authorize_params
        super.tap do |params|
          %w[display state scope].each { |v| params[v.to_sym] = request.params[v] if request.params[v] }
          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'everyplay', 'Everyplay'
