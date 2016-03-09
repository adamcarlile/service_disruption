module ServiceDisruption
  module Models
    class Arrival < BaseModel

      attribute :id, String
      attribute :operation_type, String
      attribute :vehicle_id, String
      attribute :natplan_id, String
      attribute :station_name, String
      attribute :line_id, String
      attribute :line_name, String
      attribute :platform_name, String
      attribute :direction, String
      attribute :bearing, String
      attribute :destination_naptan_id, String
      attribute :destination_name, String
      attribute :timestamp, DateTime
      attribute :time_to_station, Integer
      attribute :current_location, String
      attribute :towards, String
      attribute :expected_arrival, DateTime
      attribute :time_to_live, DateTime
      attribute :mode_name, String

      def <=>(other)
        expected_arrival <=> other.expected_arrival
      end

    end
  end
end