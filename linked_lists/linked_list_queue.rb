require_relative 'linked_list' # relative custom Entry class

class LinkedListQueue
  # A class that uses a LinkedList as its underlying data structure.

  # The queue follows the LIFO (last in first out) behavior, so
  #   using the push / shift methods will do.

  attr_accessor :queue

  def initialize val
    @queue = LinkedList.new(val)
  end

  def push(element)
    # Add element to the end of the list
    @queue.add_to_tail(element)
  end

  def shift
    # remove from front of the list
    @queue.remove_front
  end

end

# Initializing a Linked List with a node containing value (1)
llq = LinkedListQueue.new(1)

llq.push(2)
llq.push(3)
llq.shift

# Display the Linked List Queue
puts "Displaying Linked List Queue:"
llq.queue.print
