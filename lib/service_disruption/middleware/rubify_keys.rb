module ServiceDisruption
  module Middleware
    class RubifyKeys < Faraday::Middleware

      def call(request_env)
        @app.call(request_env).on_complete do |response_env|
          case response_env.body
          when Array
            response_env.body.map! {|x| x.recursively_rubify_and_symbolize_keys!.reject {|k, v| v.blank? } }
          when Hash
            response_env.body.recursively_rubify_and_symbolize_keys!.reject {|k, v| v.blank? }
          end
        end
      end

    end
  end
end