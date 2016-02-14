module ServiceDisruption
  module Models
    class Status < BaseModel

      attribute :id, String
      attribute :status_severity, String
      attribute :status_severity_description, String
      attribute :created, DateTime

    end
  end
end
