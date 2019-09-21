require_relative "./min_heap"
require "pry"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  heap = MinHeap.new
  counter = list.length

  # Remove each item from array and add to heap
  counter.times do
    node = list.pop
    heap.add(node)
  end

  # Remove each item from heap and add back to array
  counter.times do
    element = heap.remove
    list.push(element)
  end

  return list
end
