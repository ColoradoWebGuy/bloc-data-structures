
class LinkedListStack
  # A class that uses a LinkedList as its underlying data structure.
end

# array = (1..10000).map { rand }
#
# Benchmark.bmbm do |x|
#   x.report("10k Array:") { array.dup.sort! }
#   x.report("10k LinkedList:")  { array.dup.sort  }
# end

  # 1) Compare the time it takes to create a 10,000 item Array to appending
  #     10,000 items to a Linked List.
  #
  # 2( Compare the time it takes to access the 5000th element of the Array
  #     and the 5000th Node in the Linked List.
  #
  # 3) Compare the time it takes to remove the 5000th element from the Array
  #     to removing the 5000th Node in the Linked List.
  #     * In the Array, the 5001st item becomes the 5000th, and so on.
