module ServiceDisruption
  module Models
    class Line < BaseModel

      attribute :id, String
      attribute :name, String
      attribute :mode_name, String
      attribute :created, DateTime
      attribute :modified, DateTime
      attribute :line_statuses,  Collection[Models::Status], default: ->(l, a) { l.resources.status }, lazy: true, relation: true
      attribute :route_sections, Collection[Models::Route],  default: ->(l, a) { l.resources.route },  lazy: true, relation: true
      attribute :stop_points,    Collection[Models::Stop],   default: ->(l, a) { l.resources.stops },  lazy: true, relation: true

      with_resources do |map|
        map.add :status, "/line/#{id}/status",     transform: ->(r) { r[:line_statuses] }
        map.add :route,  "/line/#{id}/route",      transform: ->(r) { r[:route_sections] }
        map.add :stops,  "/line/#{id}/stoppoints"
      end

      alias_method :status, :line_statuses
      alias_method :route, :route_sections
      alias_method :stops, :stop_points

    end
  end
end
