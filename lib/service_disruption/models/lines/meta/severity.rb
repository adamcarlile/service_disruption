module ServiceDisruption
  module Models
    module Lines
      class Meta
        class Severity < BaseModel

          attribute :mode_name, String
          attribute :severity_level, Integer
          attribute :description, String

        end
      end
    end
  end
end
