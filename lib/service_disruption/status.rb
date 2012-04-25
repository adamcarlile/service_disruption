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
    end

    def to_s
      out = [@status_description]
      out << @status_details unless @status_details.nil?
      out.join(' ').color(COLOUR_CODES[@id])
    end

    def disrupted?
      [:MD, :SD, :CS].include? @id
    end

  end
end
