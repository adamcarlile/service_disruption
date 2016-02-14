module ServiceDisruption
  module Models
    class Line < BaseModel

      attribute :id, String
      attribute :name, String
      attribute :mode_name, String
      attribute :created, DateTime
      attribute :modified, DateTime
      attribute :line_statuses, Array[Models::Status]
      attribute :route_sections, Array[Models::Route]

      def resources
        @resources ||= Resources::Map.new(_client) do |map|
          map.add :status, "/line/#{id}/status", self
          map.add :route,  "/line/#{id}/route",  self
        end
      end

      def line_statuses
        super.blank? ? status.line_statuses : super
      end

      def route_sections
        super.blank? ? route.route_sections : super
      end

    end
  end
end
