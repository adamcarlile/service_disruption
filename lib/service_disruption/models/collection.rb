module ServiceDisruption
  module Models
    class Collection < Array

      def where(params={})
        criteria = params.map do |k, v|
          Proc.new do |object| 
            case 
            when v.is_a?(Regexp) then object.send(k) =~ v
            when object.send(k).is_a?(Array) then object.send(k).include?(v)
            else
              object.send(k) == v
            end
          end
        end
        select {|x| criteria.map {|y| y.call(x)}.all? }
      end

      def find_by(params={})
        where(params).first
      end

      def order_by(key)
        sort {|x| x.send(key)}
      end

    end
  end
end
