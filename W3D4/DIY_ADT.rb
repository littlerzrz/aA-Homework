# Exercise 1 - Stack
# Let's write a Stack class. To do this, use the following framework:

  class Stack
    attr_reader :mystack
    def initialize
      # create ivar to store stack here!
      @mystack = []
    end

    def self.mystack
        @mystack
    end

    def push(el)
      # adds an element to the stack
        mystack << el
    end

    def pop
      # removes one element from the stack
      mystack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      mystack[-1]
    end
  end
# 
# To test that your code works, create a new instance of the Stack class, 
# and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!


# Exercise 2 - Queue
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.

# Test your code to ensure it follows the principle of FIFO.

class Queue
    attr_reader :queue
    def initialize
        @queue = []
    end

    def self.queue
        @queue
    end

    def enqueue(el)
        queue << el
    end

    def dequeue
        queue.shift
    end

    def peek
        queue[0]
    end

end


# Exercise 3 - Map
# As you saw in the videos for tonight, a map can be implemented using a 2D array. 
# Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.

# Remember, a map stores information in key-value pairs, where the keys are always unique. 
# When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: set(key, value), get(key), 
# delete(key), show. Note that the set method can be used to either create a new key-value pair 
# or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map
    attr_reader :mymap
     
    def initialize
        @mymap = []
    end

    def self.mymap
        @mymap
    end
   
    def set(key,value)
        if !self.has_key?(key)
            mymap << [key,value]
        else
            i = self.index(key)
            mymap[i][1] = value
        end
        return mymap
    end

    def has_key?(key)
        mymap.any? {|sub| sub[0] == key }
    end

    def index(key)
        mymap.each.with_index do |sub, i|
            return i if sub[0] == key
        end
    end

    def get(key)
        mymap.each do |subArr|
            return subArr[1] if subArr[0] == key
        end
        nil
    end

    def delete(key)
        mymap.each do |subArr|
            mymap.delete(subArr) if subArr[0] == key
        end
    end

end