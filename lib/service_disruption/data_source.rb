module ServiceDisruption
  class DataSource
    include HTTParty

    def initialize(url)
      @url = URI.parse(url)
    end

    def get_latest_dataset
      self.class.get(@url.to_s).recursive_rubyfy_and_symbolize_keys!
    end

    def parse_data_set
      lines_array = []
      get_latest_dataset[:array_of_line_status][:line_status].each do |line_status|
        lines_array << line_status
      end
      lines_array
    end

    def available_lines
      parse_data_set
    end

  end
end
