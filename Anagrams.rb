# O(n!) combinatorial time
# O(n!) combinatorial space
def anagrams(string)
    return string if string.length <= 1
    possible_anagrams = []
    string = string.split("") if string.class == String

    string.each_with_index do |char, inx|
        leftout_chars = string[0...inx] + string[inx + 1..-1]
        anagrams(leftout_chars).each do |el|
            possible_anagrams << (char + el) if !possible_anagrams.include?(char + el)
        end
    end

    possible_anagrams
end

def anagram?(first_str, second_str)
    p anagrams(first_str).include?(second_str)
end

anagram?("gizmo", "sally")    #=> false
anagram?("elvis", "lives")    #=> true


#O(n^2) quadrantic time
#O(n) linear space
def second_anagram?(first_str, second_str)
    second_str_array = second_str.split("")
    first_str.each_char do |char|
        the_index = second_str_array.find_index(char)
        return false if the_index == nil
        second_str_array.delete_at(the_index)
    end

    return true if second_str_array.empty?
end


#O(nlogn) linearithmic time (because Array.sort use mergesort as default)
#O(n) linear space
def third_anagram?(first_str, second_str)
    first_arr = first_str.split("").sort
    second_arr = second_str.split("").sort
    return true if first_arr == second_arr
    false
end


#O(n) linear time complexity
#O(1) constant space
def fourth_anagram?(first_str, second_str)
    first_hash = Hash.new { |h,k| h[k] = 0 }
    second_hash = Hash.new { |h,k| h[k] = 0 }

    first_str.each_char do |char|
        first_hash[char] += 1
    end

    second_str.each_char do |char2|
        second_hash[char2] += 1
    end

    return true if first_hash == second_hash
    false
end

#O(n) linear time complexity
#O(1) constant space
def f_anagram_onehash?(first_str, second_str)
    one_hash = Hash.new(0)

    first_str.each_char { |char| one_hash[char] += 1 }
    second_str.each_char { |char| one_hash[char] -= 1 }

    one_hash.each_value.all? { |v| v == 0 }
end