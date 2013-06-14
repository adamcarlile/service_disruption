module ServiceDisruption
  class Command < Thor

    desc "start", "Start a demonized monitor"
    method_option :interval, :aliases => "-i", :default => 30, :type => :numeric, :banner => "Interval to wait to poll in seconds"
    def start
      Daemons.run_proc('service_disruption', :ARGV => ['start'], :dir_mode => :normal, :dir => '/tmp') do
        run_as_event_machine(options)
      end
    end

    desc "stop", "Stop a demonized monitor"
    def stop
      Daemons.run_proc('service_disruption', :ARGV => ['stop'], :dir_mode => :normal, :dir => '/tmp') do
        run_as_event_machine
      end
    end

    desc "status", "Show the current line status"
    def status
      puts ServiceDisruption.network
    end

    private

    def run_as_event_machine(options)
      network = ServiceDisruption.network
      EventMachine::run do
        EventMachine::add_periodic_timer(options[:interval]) do
          network.update!
        end
      end
    end

  end
end
