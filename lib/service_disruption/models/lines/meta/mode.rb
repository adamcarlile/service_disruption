module ServiceDisruption
  module Models
    module Lines
      module Meta
        class Mode < BaseModel

          attribute :name, String
          attribute :mode_group, String
          attribute :active, Boolean, default: false
          attribute :is_tfl_service, Boolean, default: false
          attribute :is_fare_paying, Boolean, default: false
          attribute :is_scheduled_service, Boolean, default: false
          attribute :is_lez_applicable, Boolean, default: false
          attribute :is_congestion_charge_applicable, Boolean, default: false
          attribute :can_use_bus_lanes, Boolean, default: false
          attribute :created, DateTime
          attribute :ics_name, String
          attribute :description, String
          attribute :is_line_status_from_ics_feed, Boolean, default: false
          attribute :default_ics_status_severity_id, Integer
          attribute :txc_mode, String
          attribute :is_group_by_operator, Boolean, default: false
          attribute :has_distinct_identifiers, Boolean, default: false
          attribute :isesui_mode, Boolean, default: false
          attribute :isics_special_mode, Boolean, default: false
          attribute :jp_modes, Array
          attribute :naptan_entries, Array
          attribute :natplan_type_codes, Array
          attribute :active_service_types, Array

          def active?
            active
          end

          %w(tfl_service, fare_paying, scheduled_service, 
             lez_applicable, line_status_from_ics_feed group_by_operator).each do |method|
            define_method "#{method}?".to_sym do
              send("is_#{method}")
            end
          end

        end
      end
    end
  end
end