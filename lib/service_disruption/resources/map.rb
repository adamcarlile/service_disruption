module ServiceDisruption
  module Resources
    class Map

      def initialize(connection)
        @connection = connection
        yield self
      end

      def endpoints
        @endpoints ||= {}
      end

      def add(name, path, options={})
        endpoints[name] = Path.new(path, connection, options)
      end

      def method_missing(name, *args, &block)
        if endpoints.keys.include?(name)
          endpoints[name].get(*args)
        else
          super
        end
      end

      private

        def connection
          @connection
        end

    end
  end
end