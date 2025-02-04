class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n) where n is the number of elements in the heap
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node

    return if @store.length < 2
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n) where n is the number of elements in the heap
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
    root_value = @store.pop.value

    heap_down(0)
    return root_value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(n) where n is the number of elements in the array
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) where n is the number of elements in the heap
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0
    parent_index = (index - 1) / 2
    if @store[parent_index].key > @store[index].key
      swap(parent_index, index)
      return heap_up(parent_index)
    else
      return
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child_i = index * 2 + 1
    right_child_i = index * 2 + 2
    return if @store[left_child_i] == nil

    # Find smaller child.
    smaller_child_i = left_child_i
    if @store[right_child_i] != nil
      smaller_child_i = (@store[left_child_i].key <= @store[right_child_i].key) ? left_child_i : right_child_i
    end

    if @store[index].key > @store[smaller_child_i].key
      swap(index, smaller_child_i)
      return heap_down(smaller_child_i)
    else 
      return
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
