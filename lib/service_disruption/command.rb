module ServiceDisruption
  class Command < Thor

    desc "status", "Show the current line status"
    def status
      puts ServiceDisruption.network
    end

    desc "timer", "Set the timer to automatically iterate"
    def timer
      network = ServiceDisruption.network
      EventMachine::run do
        EventMachine::add_periodic_timer(30) do
          network.update!
          puts network
        end
      end
    end

  end
end
