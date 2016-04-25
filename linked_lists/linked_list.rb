require 'benchmark'

class LinkedList

  #LinkedList must keep track of its head node.
  attr_accessor :head_node

  def add_to_tail(data)
    #This method creates a new Node using data, and inserts it at the end of the list.
  end

  def remove_tail()
    #This method removes the last node in the lists.
    #This method must keep the rest of the list intact.
  end

  def print()
    #This method prints out a representation of the list.
  end

  def delete(node)
    #This method removes node from the list.
    #This method must keep the rest of the list intact.
  end

  def add_to_front(node)
    #This method adds node to the front of the list.
    #This method must set the list's head to node.
  end

  def remove_front()
    #This method removes and returns the first node in the Linked List.
    #This method must set Linked List's head to the second node.
  end

end

n = 50000
Benchmark.bm do |x|
  # 1) Compare the time it takes to create a 10,000 item Array to appending
  #     10,000 items to a Linked List.
  #
  # 2( Compare the time it takes to access the 5000th element of the Array
  #     and the 5000th Node in the Linked List.
  #
  # 3) Compare the time it takes to remove the 5000th element from the Array
  #     to removing the 5000th Node in the Linked List.
  #     * In the Array, the 5001st item becomes the 5000th, and so on.
end
