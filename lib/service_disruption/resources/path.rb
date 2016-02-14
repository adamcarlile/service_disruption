module ServiceDisruption
  module Resources
    class Path

      def initialize(path, model, connection, options={})
        @path, @model, @connection, @options = path, model, connection, options
      end

      def get(params={})
        response = @connection.get(substituted_path(params)).body
        if @model.is_a? Class
          @model.from_payload(response, @connection)
        else
          response = response.first if response.is_a?(Array) && response.length == 1
          @model.attributes = response
          @model
        end
      end

      private

        def fragments
          @fragments ||= /(:\w*)/.match(@path).captures.each_with_object({}) do |capture, obj|
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
          path = @path.dup
          params.each do |key, value|
            path.gsub! fragments[key.to_sym], value.to_s
          end
          path
        end

        def parse_array(params)
          path = @path.dup
          params.each_with_index do |value, index|
            path.gsub! fragments.values[index], value.to_s
          end
          path
        end

    end
  end
end