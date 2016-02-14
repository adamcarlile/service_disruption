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

      def add(name, path, model, options={})
        endpoints[name] = Path.new(path, model, connection, options)
      end

      private

        def connection
          @connection
        end

    end
  end
end