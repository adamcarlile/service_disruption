module ServiceDisruption
  class DataSource
    include HTTParty

    def initialize(url)
      @url = URI.parse(url)
    end

    def get_latest_dataset
      response = self.class.get(@url.to_s)
      if response.success?
        response.recursive_rubyfy_and_symbolize_keys!
      else
        false
      end
      rescue
        false
    end

    def parse_data_set
      lines_array = []
      if get_latest_dataset
        get_latest_dataset[:array_of_line_status][:line_status].each do |line_status|
          lines_array << line_status
        end
      end
      lines_array
    end

    def available_lines
      parse_data_set
    end

  end
end
