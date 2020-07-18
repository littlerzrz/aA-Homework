fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. 
# Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(arr)
    max = ''
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if j > i
                arr[i].length > arr[j].length ? max = arr[i] : max = arr[j]
            end
        end
    end
    max
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. 
# Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. 
# Remember that Big O is classified by the dominant term.

def dominant_octopus(arr)
    res = quick_sort_fish(arr)
    res[-1]
end

def quick_sort_fish(arr)
    return arr if arr.length <= 1
    pivot = arr[0]
    left = arr.select {|ele| ele.length < pivot.length}
    right = arr.select {|ele| ele.length > pivot.length}
    
    quick_sort_fish(left) + [pivot] + quick_sort_fish(right)
end




# Clever Octopus
# Find the longest fish in O(n) time. 
# The octopus can hold on to the longest fish that you 
# have found so far while stepping through the array only once.

def clever_octopus(arr)
    max = arr[0]
    arr.each do |ele|
       max = ele if ele.length > max.length
    end
    max
end




# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. 
# The game has tiles in the following directions:

tiles_array = 
["up", "right-up", "right", "right-down", 
"down", "left-down", "left",  "left-up" ]

# To play the game, the octopus must step on a tile with her corresponding 
# tentacle. We can assume that the octopus's eight tentacles 
# are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, 
# iterate through a tiles array to return 
# the tentacle number (tile index) the octopus must move. 
# This should take O(n) time.

def slow_dance(str, arr)
    (0...arr.length).each do |i|
        return i if arr[i] == str
    end
    nil
end


# p slow_dance("up", tiles_array)
# # > 0

# p slow_dance("right-down", tiles_array)
# # > 3


# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. 
# Use a different data structure and write a new function so that 
# you can access the tentacle number in O(1) time.

 new_tiles_data_structure = {
     "up" => 0, 
     "right-up" => 1,
     "right" => 2, 
     "right-down" =>3, 
     "down" => 4, 
     "left-down" => 5, 
     "left" => 6,  
     "left-up" => 7
    }

    def fast_dance(str,hash)
        hash[str]
    end



p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3