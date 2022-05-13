# This is the complex solution with time complexity of O(n^2) (n square)
def my_min(list)
    list.each_with_index do |el, index1|
        min_num = true
        list.each_with_index do |el2, index2|
            next if index1 == index2
            min_num = false if el > el2
        end
        return el if min_num
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5



#This is the simple solution with time complexity of O(n)
def better_min(list)
    temp_min = list[0]

    list.each_with_index do |ele, index|
        next if index == 0
        temp_min = ele if ele < temp_min
    end

    p temp_min
end



#Largest Contiguous Sub-sum
#Below is the Phase I solution with a time complexity of O(n^2) (n square)
def largest_contiguous_subsum(list)
    all_sublists = []
    len = list.length

    (0..len-1).each do |start_inx|
        (start_inx + 1..len-1).each do |end_inx|
            all_sublists << list[start_inx..end_inx].sum
        end
    end

    p all_sublists.max
end

# list = [2, 3, -6, 7, -6, 7]
# largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])



#Below is the Phase II solution with a time complexity of O(n)
def better_largest_subsum(list)
    final_largest = list[0]
    current_largest = list[0]

    (1...list.length).each do |inx|
        current_largest = 0 if current_largest < 0
        current_largest += list[inx]
        final_largest = current_largest if current_largest > final_largest
    end

    p final_largest
end

# list = [2, 3, -6, 7, -6, 7]
# better_largest_subsum(list)