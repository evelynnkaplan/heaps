require_relative "./min_heap"
require "pry"

# This method uses a heap to sort an array.
# Time Complexity:  O (n log n) where n is the number of items in the list. The two loops are O(n) and adding/removing from a heap is O (log n). Inserting/removing from an array is O(n).
# Space Complexity: O(n) where n is the number of items in the list because you are creating a new heap that needs to store n number of items.
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
