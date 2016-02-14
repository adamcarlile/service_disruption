module ServiceDisruption
  module Models
    class BaseModel
      include Virtus.model

      class << self

        def from_payload(payload, connection)
          case payload
          when Array then payload.map { |x| new(x.merge(client: connection)) }
          when Hash then [new(payload.merge(client: connection))]
          end
        end

      end

      def initialize(args)
        @_client = args.delete(:client) if args[:client]
        super(args)
      end

      def method_missing(name, *args, &block)
        if resources.is_a?(Resources::Map) && resources.endpoints.keys.include?(name)
          resources.endpoints[name].get(*args)
        else
          super
        end
      end

      private

        def _client
          @_client
        end

    end
  end
end