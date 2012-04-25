module ServiceDisruption
  class Status

    COLOUR_CODES = {
      :GS => :green,
      :MD => :yellow,
      :SD => :red,
      :CS => :yellow,
      :PS => :red
    }

    attr_accessor :id, :status_details, :status_description, :active

    def initialize(status, status_details)
      @id                 = status[:id].upcase.to_sym
      @status_details     = status_details
      @status_description = status[:description]
      @active             = status[:is_active]
      @updated_at         = Time.now
    end

    def image
      "#{ROOT_PATH}/static/#{@id.to_s.downcase}.png"
    end

    def to_s
      out = [@status_description]
      out << @status_details unless @status_details.nil?
      out.join(' ').color(COLOUR_CODES[@id])
    end

    def disrupted?
      [:MD, :SD, :CS].include? @id
    end

    def ==(another_status)
      (self.id == another_status.id) && (self.status_details == another_status.status_details)
    end

  end
end
