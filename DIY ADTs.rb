class Stack
    def initialize
      # create ivar to store stack here!
      @stack_array = []
    end

    def push(el)
      # adds an element to the stack
      @stack_array << el
    end

    def pop
      # removes one element from the stack
      @stack_array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack_array[-1]
    end
  end

class Queue
    def initialize
        @queue_arr = []
    end

    def enqueue(el)
        @queue_arr.push(el)
    end

    def dequeue
        @queue_arr.shift
    end

    def peek
        @queue_arr.last
    end
end

class Map
    def initialize
        @map_arr = Array.new {Array.new([])}
    end

    def set(key, value)
        @map_arr.push([key, value])
    end

    def get(key)
        @map_arr.each_with_index do |pair, i|
            return @map_arr[i] if pair[0] == key
        end
    end

    def delete(key)
        @map_arr.reject! { |pair| pair[0] == key }
    end

    def show
        @map_arr
    end
end