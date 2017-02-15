module ServiceDisruption
  module Models
    class BaseModel
      include Comparable
      include Virtus.model
      include Virtus.relations

      class << self
        attr_accessor :resources

        def from_payload(payload, connection)
          case payload
          when Array then payload.map { |x| new(x.merge(client: connection)) }
          when Hash then new(payload.merge(client: connection))
          end
        end

        def with_resources &block
          @resources = block if block_given?
        end

      end

      def <=>(other)
        to_s <=> other.to_s
      end

      def initialize(args)
        @client = args.delete(:client) if args[:client]
        super(args)
      end

      def resources
        @resources ||= Resources::Map.new(client) do |map|
          instance_exec map, &self.class.resources
        end
      end

      def client
        @client.blank? ? parent.client : @client
      end

    end
  end
end