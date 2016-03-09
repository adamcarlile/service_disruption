module ServiceDisruption
  module Models
    class Stop < BaseModel

      attribute :id, String
      attribute :naptan_id, String
      attribute :modes, Array[String]
      attribute :ics_code, String
      attribute :stop_type, String
      attribute :station_naptan, String
      attribute :status, String
      attribute :common_name, String
      attribute :place_type, String
      attribute :lat, Float
      attribute :lon, Float
      attribute :arrivals, Collection[Models::Arrival], default: ->(l, a) { l.resources.arrivals }, lazy: true, relation: true

      alias_method :name, :common_name

      with_resources do |map|
        map.add :arrivals, "/stoppoint/#{id}/arrivals"
      end

    end
  end
end
