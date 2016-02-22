module ServiceDisruption
  class Client
    extend Forwardable

    attr_reader :config
    def initialize(config={})
      @config = config
    end

    def connection
      @connection ||= Faraday.new(url: config[:url]) do |connection|
        connection.request :json
        connection.params[:app_id]  = config[:app_id]
        connection.params[:app_key] = config[:app_key]
        
        connection.use Faraday::Response::RaiseError

        connection.use Middleware::RubifyKeys
        connection.response :json, :content_type => /\bjson$/

        connection.adapter Faraday.default_adapter
      end
    end

    def resources
      @resources ||= Resources::Map.new(connection) do |map|
        map.add :line,  '/line/:id',             model: Models::Line
        map.add :mode,  '/line/mode/:id',        model: Models::Line
        map.add :route, '/line/route',           model: Models::Line
        map.add :status,'/line/mode/:id/status', model: Models::Line
      end
    end

    def method_missing(name, *args, &block)
      if resources.endpoints.keys.include?(name)
        resources.endpoints[name].get(*args)
      else
        super
      end
    end

  end
end