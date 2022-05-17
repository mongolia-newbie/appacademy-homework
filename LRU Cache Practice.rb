class LRUCache

    def initialize(size)
        @cache_array = []
        @max_size = size
    end

    def count
      # returns number of elements currently in cache
        @cache_array.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if self.count < @max_size
        if @cache_array.include?(el)
            existed_to_end(el)
        else
            @cache_array << el
        end
      else
        if @cache_array.include?(el)
            existed_to_end(el)
        else
            not_existed(el)
        end
      end

    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache_array
    end

    private
    # helper methods go here!
    def existed_to_end(el)
        the_inx = @cache_array.index(el)
        @cache_array.delete_at(the_inx)
        @cache_array.push(el)
    end

    def not_existed(el)
        @cache_array.shift
        @cache_array.push(el)
    end

end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]