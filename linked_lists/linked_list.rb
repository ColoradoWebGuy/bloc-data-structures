require_relative 'node' # relative Node class

require 'benchmark'

# What is Spatial Locality and why does it benefit performance?

# Spatial locality is a term describing data representing itself in a sequence of
#   references that are close in time and space.
#
# The advenatage of Spatial locality is by calling a series of sequential
#   locations in a block.

# LinkedList -> This class holds the linked list functions - adding a node,
#   traversing and displaying the linked list
# # A LinkedList is a list of items encapsulated in nodes in sequential order.
class LinkedList

  #LinkedList must keep track of its head node.
  def initialize val
      # Initialize a new node at the head
      @head = Node.new(val,nil)
  end

  def add_to_tail(data)
    #This method creates a new Node using data, and inserts it at the end of the list.

    # Traverse to the end of the list
    # And insert a new node over there with the specified value
    current = @head
    while current.next_node != nil
        current = current.next_node
    end
    current.next_node = Node.new(data,nil)
  end

  def remove_tail()
    #This method removes the last node in the lists.
    #This method must keep the rest of the list intact.
    @head.pop()
  end

  def print()
    #This method prints out a representation of the list.
    # Traverse through the list till you hit the "nil" at the end
    current = @head
    full_list = []
    while current.next_node != nil
        full_list += [current.value.to_s]
        current = current.next_node
    end
    full_list += [current.value.to_s]
    puts full_list.join("->")
  end

  def get_item_at(index)
    i = -1
    current = @head
    current = current.next_node until index == i += 1
    current.value
  end

  def delete(node)
    #This method removes node from the list.
    #This method must keep the rest of the list intact.
    current = @head
    if current.value == node
        # If the head is the element to be delete, the head needs to be updated
        @head = @head.next_node
    else
        # ... x -> y -> z
        # Suppose y is the value to be deleted, you need to reshape the above list to :
        #   ... x->z
        # ( and z is basically y.next_node )
        current = @head
        while (current != nil) && (current.next_node != nil) && ((current.next_node).value != node)
            current = current.next_node
        end

        if (current != nil) && (current.next_node != nil)
            current.next_node = (current.next_node).next_node
        end
    end
  end

  def add_to_front(node)
    #This method adds node to the front of the list.
    #This method must set the list's head to node.
    @head.unshift(Node.new(node,nil))
  end

  def remove_front()
    #This method removes and returns the first node in the Linked List.
    #This method must set Linked List's head to the second node.

    current = @head
    # remove first element by shifting the list over one entry
    current.shift
    return current.next_node
  end

end

# 1) Compare the time it takes to create a 10,000 item Array to appending
#     10,000 items to a Linked List.

# timing an array made with 10k items
time = Benchmark.realtime do
  array = []
  (1..10000).each { |i|
    array.push(i)
  }
  puts "Array length: #{array.length}"
end
puts "Time elapsed to create a 10,000 item array: #{time*1000} milliseconds"
puts "verses..."
# timing an array made with 10k items
time = Benchmark.realtime do
  ll = LinkedList.new(0)
  (1..10000).each { |i|
    ll.add_to_tail(i)
  }
end
puts "Time elapsed to add a 10,000 items to LinkedList: #{time*1000} milliseconds"

puts "************************"
# 2( Compare the time it takes to access the 5000th element of the Array
#     and the 5000th Node in the Linked List.
time = Benchmark.realtime do
  array = []
  (1..10000).each { |i|
    array.push(i)
  }
  access = array[4999]
  puts "Accessed: #{access}"
end
puts "Time elapsed to access 5,000th element in array: #{time*1000} milliseconds"
puts "verses..."
# timing an array made with 10k items
time = Benchmark.realtime do
  ll = LinkedList.new(0)
  (1..10000).each { |i|
    ll.add_to_tail(i)
  }
  accessed = ll.get_item_at(5000)
  puts "Accessed node: #{accessed}"
end
puts "Time elapsed to access the 10,000th item in LinkedList: #{time*1000} milliseconds"
puts "************************"

# 3) Compare the time it takes to remove the 5000th element from the Array
#     to removing the 5000th Node in the Linked List.
#     * In the Array, the 5001st item becomes the 5000th, and so on.
time = Benchmark.realtime do
  array = []
  (1..10000).each { |i|
    array.push(i)
  }
  array.delete_at(5000)
  puts "removed 5000th element: #{array.length}"
end
puts "Time elapsed to remove 5,000th element in array: #{time*1000} milliseconds"
puts "verses..."
# timing an array made with 10k items
time = Benchmark.realtime do
  ll = LinkedList.new(0)
  (1..10000).each { |i|
    ll.add_to_tail(i)
  }
  ll.delete(5000)
end
puts "Time elapsed to remove the 5,000th item in LinkedList: #{time*1000} milliseconds"
