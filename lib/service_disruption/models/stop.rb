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

    end
  end
end
