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
        connection.response :json, content_type: /\bjson$/

        connection.adapter Faraday.default_adapter
      end
    end

    def line
      @resources ||= Resources::Map.new(connection) do |map|
        map.add :find,  '/line/:id',             model: Models::Lines::Line
        map.add :mode,  '/line/mode/:id',        model: Models::Lines::Line
        map.add :route, '/line/route',           model: Models::Lines::Line
        map.add :status,'/line/mode/:id/status', model: Models::Lines::Line
        map.add :meta,  '/line/meta/:type',      model: Models::Lines::Meta
      end
    end

  end
end