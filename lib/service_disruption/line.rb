module ServiceDisruption
  class Line

    attr_accessor :name, :status, :id

    def initialize(line)
      @id     = line[:line][:id]
      @name   = line[:line][:name]
      @status = ServiceDisruption::Status.new(line[:status], line[:status_details])
      ServiceDisruption.notifier.status_change(self) if @status.disrupted?
    end

    def to_s
      "#{@name}: #{@status}"
    end

    def update_status(data)
      old_status = @status
      new_status = ServiceDisruption::Status.new(data[:status], data[:status_details])
      unless old_status == new_status
        @status = new_status
        ServiceDisruption.notifier.status_change(self)
      end
    end

    def disrupted?
      @status.disrupted?
    end

  end
end
