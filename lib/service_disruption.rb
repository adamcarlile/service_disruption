require 'active_support'
require 'active_support/core_ext'
require 'faraday'
require 'faraday_middleware'
require 'virtus'
require 'virtus/relations'
require 'pry'

require 'service_disruption/extensions/hash'

module ServiceDisruption

  autoload :Version,  'service_disruption/version'
  autoload :Client,   'service_disruption/client'

  module Middleware
    autoload :RubifyKeys, 'service_disruption/middleware/rubify_keys'
  end

  module Models
    autoload :BaseModel,  'service_disruption/models/base_model'
    autoload :Collection, 'service_disruption/models/collection'

    module Lines
      autoload :Arrival,    'service_disruption/models/lines/arrival'
      autoload :Status,     'service_disruption/models/lines/status'
      autoload :Route,      'service_disruption/models/lines/route'
      autoload :Stop,       'service_disruption/models/lines/stop'
      autoload :Line,       'service_disruption/models/lines/line'
      module Meta
        autoload :DisruptionCatagory, 'service_disruption/models/lines/meta/disruption_catagory'
        autoload :Mode,               'service_disruption/models/lines/meta/mode'
        autoload :ServiceType,        'service_disruption/models/lines/meta/service_type'
        autoload :Severity,           'service_disruption/models/lines/meta/severity'
      end
    end
  end

  module Resources
    autoload :Path, 'service_disruption/resources/path'
    autoload :Map,  'service_disruption/resources/map'
  end

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