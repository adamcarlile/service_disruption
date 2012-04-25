module ServiceDisruption
  class Line

    attr_accessor :name, :status, :id

    def initialize(line)
      @id     = line[:line][:id]
      @name   = line[:line][:name]
      @status = ServiceDisruption::Status.new(line[:status], line[:status_details])
    end

    def to_s
      "#{@name}: #{@status}"
    end

    def update_status(data)
      @status = ServiceDisruption::Status.new(data[:status], data[:status_details])
    end

    def disrupted?
      @status.disrupted?
    end

  end
end
