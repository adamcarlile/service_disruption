module ServiceDisruption
  module Resources
    class Map

      def initialize(connection)
        @connection = connection
        yield self if block_given?
      end

      def endpoints
        @endpoints ||= {}
      end

      def resources
        @resources ||= {}
      end

      def add(name, path, options={})
        endpoints[name] = Path.new(path, connection, options)
      end

      def resource(name, &block)
        resources[name] = self.class.new(@connection, &block)
      end

      def method_missing(name, *args, &block)
        if endpoints.keys.include?(name)
          endpoints[name].get(*args)
        elsif resources.keys.include?(name)
          resources[name]
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