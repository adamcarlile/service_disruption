module ServiceDisruption
  module Models
    module Lines
      class Route < BaseModel

        attribute :name, String
        attribute :direction, String
        attribute :origination_name, String
        attribute :destination_name, String
        attribute :originator, String
        attribute :destination, String
        attribute :service_type, String

      end
    end
  end
end