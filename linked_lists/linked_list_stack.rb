require_relative 'linked_list' # relative custom Entry class

class LinkedListStack
  # A class that uses a LinkedList as its underlying data structure.

  # The stack follows the LIFO (last in first out) behavior, so
  #   using the pop / push methods will make that work.

  attr_accessor :stack

  def initialize val
    @stack = LinkedList.new(val)
  end

  def push(element)
    #adds to end of list
    @stack.add_to_tail(element)
  end

  def pop
    #takes off end of list
    @stack.remove_tail
  end

end

# Initializing a Linked List with a node containing value (1)
lls = LinkedListStack.new(1)

lls.push(2)
lls.push(3)
lls.pop

# Display the Linked List Stack
puts "Displaying Linked List Stack:"
lls.stack.print
