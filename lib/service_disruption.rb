require 'active_support'
require 'active_support/core_ext'
require 'faraday'
require 'faraday_middleware'
require 'virtus'
require 'virtus/relations'
require 'pry'

require 'service_disruption/extensions/hash'
require 'service_disruption/middleware/rubify_keys'

require 'service_disruption/models/base_model'
require 'service_disruption/models/collection'
require 'service_disruption/models/arrival'
require 'service_disruption/models/status'
require 'service_disruption/models/route'
require 'service_disruption/models/stop'
require 'service_disruption/models/line'

require 'service_disruption/resources/path'
require 'service_disruption/resources/map'

require 'service_disruption/version'
require 'service_disruption/client'

module ServiceDisruption

  module_function

  def config
    @config ||= {
      url: 'https://api.tfl.gov.uk',
      app_id: ENV['APP_ID'],
      app_key: ENV['APP_KEY']
    }
  end

  def configure(&block)
    yield config
  end

  def new(overrides={})
    Client.new(config.merge(overrides))
  end

end