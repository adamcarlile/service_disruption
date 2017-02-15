module ServiceDisruption
  module Models
    module Lines
      class Status < BaseModel

        attribute :id, String
        attribute :status_severity, String
        attribute :status_severity_description, String
        attribute :created, DateTime

      end
    end
  end
end
