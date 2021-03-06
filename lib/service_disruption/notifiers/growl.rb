module ServiceDisruption
  module Notifiers
    class Growl

      def initialize
        @client = GNTP.new("Service Disruption")
        register_notifications
      end

      def status_change(line)
        @client.notify({:name  => "status_change",
          :title => "#{line.name} | #{line.status.status_description}",
          :text  => line.status.status_details,
          :icon  => line.status.image,
          :sticky => true
        })
        true
        rescue
          false
      end

      private

        def register_notifications
          @client.register({:notifications => [{
            :name     => "status_change",
            :enabled  => true,
            }]
          })
          true
          rescue
            false
        end

    end
  end
end
