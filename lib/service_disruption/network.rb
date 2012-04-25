module ServiceDisruption
  class Network

    attr_accessor :lines, :updated_at

    def initialize(data_source)
      @lines = []
      @updated_at = Time.now
      data_source.available_lines.each {|x| add_line ServiceDisruption::Line.new(x)}
    end

    def add_line(line)
      @lines << line
    end

    def [](index)
      @lines[index]
    end

    def find_by_name(name)
      @lines.select {|x| x.name == name}
    end

    def find_by_id(id)
      @lines.select {|x| x.id == id}
    end

    def update!
      begin
        ServiceDisruption.data_source.available_lines.each do |new_data|
          line = find_by_id(new_data[:line][:id]).first
          line.update_status(new_data)
        end
        @updated_at = Time.now
        true
      rescue
        false
      end
    end

    def to_s
      out = []
      out << ' '
      out << '==========================='
      out << @lines
      out << '==========================='
      out << "Updated at: #{@updated_at}"
      out << '==========================='
      out << ' '
      out.join("\n")
    end

  end
end
