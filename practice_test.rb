# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.

def first_even_numbers_sum(n)
  return 2 if n == 1
  2 * n + first_even_numbers_sum(n-1)
end

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  return true if string.include?(key)
  return false if key.length == 1 && !string.include?(key)
  if string.include?(key[0])
    pivot_letter_index = string.index(key[0])
    string_include_key?(string[pivot_letter_index + 1..-1], key[1..-1])
  else
    return false
  end
end

class Array
  # Write an `Array#median` method that returns the median element in an array.
  # If the length is even, return the average of the middle two elements.

  def median
    return nil if self.empty?
    length = self.length
    sorted_self = self.sort
    if length.even?
      (sorted_self[length/2 - 1] + sorted_self[length/2]) / 2.0
    else
      sorted_self[(length - 1) / 2]
    end
  end
end

# Define a method `titleize(title)` that capitalizes each word in a string like 
# a book title.  First word in a title should always be capitalized.  Do not 
# capitalize words like 'a', 'and', 'of', 'over' or 'the'.

def titleize(title)
  exceptions = ['a', 'and', 'of', 'over', 'the']
  result = title.split(" ").map.with_index do |word, i|
    if !exceptions.include?(word)
      word.capitalize 
    elsif exceptions.include?(word) && i == 0
      word.capitalize
    else
      word
    end
  end
  result.join(" ")
end

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    len = self.length
    0.upto(len - 1) { |i| prc.call(self[i]) }
    self
  end
end

class Array
  # Define a method `Array#my_select(&prc)` that correctly returns an array of 
  # selected elements according to the block. **Do NOT use the built-in 
  # `Array#select` or `Array#reject` in your implementation.**

  def my_select(&prc)
    selected = []
    self.each { |ele| selected << ele if prc.call(ele) }
    selected
  end  
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array. 
  # Do NOT call the built-in `Array#sort` or `Array#sort_by` methods in 
  # your implementation. 
  
  def bubble_sort(&prc)
    return self if self.length == 0 || self.length == 1
    prc ||= Proc.new {|a, b| a <=> b }
    arr_length = self.length
    status = false
    new_arr = self.map {|ele| ele }

    while status == false
      status = true if (0..arr_length - 2).all? {|i| prc.call(new_arr[i], new_arr[i+1]) <= 0 }
      (0..arr_length - 2).each do |i|
        if prc.call(new_arr[i], new_arr[i+1]) > 0
          new_arr[i], new_arr[i+1] = new_arr[i+1], new_arr[i]
        end
      end
    end
    new_arr
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    
  end
end

