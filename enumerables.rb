class Array
    def my_each(&prc)
        len = self.length
        len.times {|i| prc.call(self[i])}
        self
    end

    def my_select(&prc)
        result = []
        self.my_each do |ele|
            result << ele if prc.call(ele)
        end
        result
    end

    def my_reject(&prc)
        result = []
        self.my_each do |ele|
            result << ele if !prc.call(ele)
        end
        result
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        result = []
        self.my_each do |ele|
            result << ele if prc.call(ele)
        end
        return true if self.length == result.length
        return false
    end

    def my_flatten
        flattened = []

        self.each do |ele|
            if ele.is_a?(Array)
                flattened += ele.my_flatten
            else
                flattened << ele
            end
        end

        flattened
    end

    def my_zip(*args)
        len = self.length
        result = Array.new(len) {Array.new([])}

        (0...len).each do |out_idx|
            (0...args.count + 1).each do |inner_inx|
                if inner_inx == 0
                    result[out_idx][inner_inx] = self[out_idx]
                elsif args[inner_inx - 1][out_idx] == nil
                    result[out_idx][inner_inx] = nil
                else
                    result[out_idx][inner_inx] = args[inner_inx - 1][out_idx]
                end
            end
        end
        result
    end

    def my_rotate(element = 1)
        len = self.length
        after_rotate = Array.new(len, nil)
        self.each.with_index do |ele, i|
            if element > 0
                after_rotate[i - element % len] = ele
            else
                after_rotate[(i - element % len) % len] = ele
            end
        end
        after_rotate
    end

    def my_join(str = "")
        join_result = ""
        self.my_each do |ele|
            join_result += ( ele + str )
        end
        if str == ""
            p join_result
        else
            p join_result = join_result[0...-1]
        end
    end

    def my_reverse
        reversed_array = []
        (self.length - 1).downto(0) do |i|
            reversed_array << self[i]
        end
        p reversed_array
    end

end