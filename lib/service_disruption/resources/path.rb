module ServiceDisruption
  module Resources
    class Path

      attr_reader :options, :connection, :path

      def initialize(path, connection, options={})
        @path, @connection = path, connection
        @options = default_options.merge(options)
      end

      def get(params={})
        response = connection.get(substituted_path(params)).body
        response = response.first if response.is_a?(Array) && response.length == 1
        return model.from_payload(response, connection) if model.is_a?(Class)
        response = transform.call(response) if transform
        response
      end

      def model
        options[:model]
      end

      def transform
        options[:transform]
      end

      private

        def default_options
          {
            model: nil,
            transform: nil
          }
        end

        def fragments
          @fragments ||= /(:\w*)/.match(path).captures.each_with_object({}) do |capture, obj|
            obj[capture.delete(':').to_sym] = capture
          end 
        end

        def substituted_path(*params)
          params = params.first if params.first.is_a?(Hash)
          case params
          when Array then parse_array(params)
          when Hash then parse_hash(params)
          end
        end

        def parse_hash(params)
          path = self.path.dup
          params.each do |key, value|
            path.gsub! fragments[key.to_sym], value.to_s
          end
          path
        end

        def parse_array(params)
          path = self.path.dup
          params.each_with_index do |value, index|
            path.gsub! fragments.values[index], value.to_s
          end
          path
        end

    end
  end
end