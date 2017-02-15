module ServiceDisruption
  module Models
    module Lines
      module Meta
        class Severity < BaseModel

          attribute :mode_name, String
          attribute :severity_level, Integer
          attribute :description, String

        end
      end
    end
  end
end
