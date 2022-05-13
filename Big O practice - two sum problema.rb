#O(n^2) time complexity
#O(1) constant space complexity
def bad_two_sum?(arr, target_sum)
    sum_result = []
    arr.each_with_index do |ele1, inx1|
        arr.each_with_index do |ele2, inx2|
            next if inx1 == inx2
            sum_result << ele1 + ele2
        end
    end

    p sum_result.include?(target_sum)
end

arr = [0, 1, 5, 7]
bad_two_sum?(arr, 6) # => should be true
bad_two_sum?(arr, 10) # => should be false


#O(nlogn) time complexity
#O(n) linear space complexity
def okay_two_sum?(arr, target_sum)
    arr = arr.sort

    arr.each_with_index do |ele, inx|
        temp = arr.dup
        temp.delete_at(inx)
        return true if temp.include?(target_sum - ele)
    end

    false
end

def okay_two_sum_a?(arr, target_sum)
    arr = arr.sort
    i, j = 0, arr.length - 1
  
    while i < j
      case (arr[i] + arr[j]) <=> target_sum
      when 0
        return true
      when -1
        i += 1
      when 1
        j -= 1
      end
    end
  
    false
  end


#O(n) time complexity
#O(n) space complexity
def two_sum?(arr, target_sum)
    the_hash = Hash.new(0)

    arr.each { |ele| the_hash[ele] += 1 }

    the_hash.each do |k, v|
        return true if the_hash.has_value?(target_sum - k)
    end

    false
end