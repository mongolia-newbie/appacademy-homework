# 气泡排序的算法
def bb(arr)
    status = false

    while !status
        status = true
        (0...arr.length-1).each do |i|
            if arr[i] > arr[i+1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                status = false
            end
        end
    end

    p arr
end

arr = [5,4,3,2,1]
bb(arr)

# 找质数的一种算法，有更简单的
def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

#Merge Sort 算法，面试大概率考
class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end

end


#bSearch Solution 算法，面试大概率考
def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
  end
  
end

# LeetCode 第一题 在不重复的integer array里寻找两个数字使之和等于目标数字，返回index
def two_sum(nums, target)
  hashmap = Hash.new
  
  nums.each_with_index do |num, i|
      lookfor = target - num
      return [i, hashmap[lookfor]] if hashmap.has_key?(lookfor)
      hashmap[num] = i
  end
end

#Maximum Subarray（如果下一个数自己，比前面的累积（无论单个还是多个）加上下一个数
#还要大，那么就可以完全舍弃掉前面的累积）
def max_sub_array(nums)
  len = nums.length
  output = nums[0]
  current = nums[0]
  (1...len).each do |i|
      if nums[i] < current + nums[i]
         current += nums[i] 
      else
          current = nums[i]
      end
      output = current if current > output
  end
  
  output
end
