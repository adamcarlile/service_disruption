module ServiceDisruption
  module Models
    module Lines
      module Meta
        class Mode < BaseModel

          attribute :name, String
          attribute :mode_group, String
          attribute :active, Boolean
          attribute :is_tfl_service, Boolean
          attribute :is_fare_paying, Boolean
          attribute :is_scheduled_service, Boolean
          attribute :is_lez_applicable, Boolean
          attribute :is_congestion_charge_applicable, Boolean
          attribute :can_use_bus_lanes, Boolean
          attribute :created, DateTime
          attribute :ics_name, String
          attribute :description, String
          attribute :is_line_status_from_ics_feed, Boolean
          attribute :default_ics_status_severity_id, Integer
          attribute :txc_mode, String
          attribute :is_group_by_operator, Boolean
          attribute :has_distinct_identifiers, Boolean
          attribute :isesui_mode, Boolean
          attribute :isics_special_mode, Boolean
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