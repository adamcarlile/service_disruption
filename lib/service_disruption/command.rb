module ServiceDisruption
  class Command < Thor

    desc "start", "Run the monitor"
    method_option :daemonize, :aliases => "-d", :default => false, :type => :boolean, :banner => "Run as daemon"
    method_option :interval, :aliases => "-i", :default => 30, :type => :numeric, :banner => "Interval to wait to poll in seconds"
    def start
      network = ServiceDisruption.network
      EventMachine::run do
        EventMachine::add_periodic_timer(options[:interval]) do
          network.update!
        end
      end
    end

    desc "status", "Show the current line status"
    def status
      puts ServiceDisruption.network
    end

  end
end
