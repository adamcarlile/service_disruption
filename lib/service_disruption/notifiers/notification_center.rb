module ServiceDisruption
  module Notifiers
    class NotificationCenter

      def initialize
        @client = TerminalNotifier
      end

      def status_change(line)
        @client.notify(line.status.status_details, :title => line.name , :subtitle => line.status.status_description)
      end

    end
  end
end
