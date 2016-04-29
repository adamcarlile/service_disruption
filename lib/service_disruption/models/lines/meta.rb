module ServiceDisruption
  module Models
    module Lines
      class Meta < BaseModel

        attribute :modes,                 Collection[Models::Lines::Meta::Mode],                default: ->(l, a) { l.resources.modes }, lazy: true, relation: true
        attribute :severity,              Collection[Models::Lines::Meta::Severity],            default: ->(l, a) { l.resources.severity }, lazy: true, relation: true
        attribute :disruption_catagories, Collection[Models::Lines::Meta::DisruptionCatagory],  default: ->(l, a) { l.resources.disruption_catagories }, lazy: true, relation: true
        attribute :service_types,         Collection[Models::Lines::Meta::ServiceType],         default: ->(l, a) { l.resources.service_types }, lazy: true, relation: true

        with_resources do |map|
          map.add :modes,                 '/line/meta/modes'
          map.add :severity,              '/line/meta/severity'
          map.add :disruption_catagories, '/line/meta/disruptioncatagories', transform: ->(r) { r.map {|x| {name: x}} }
          map.add :service_types,         '/line/meta/servicetype',          transform: ->(r) { r.map {|x| {name: x}} }
        end

      end
    end
  end
end

