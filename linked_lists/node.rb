# Quick Example of a Self Referential Data Structure in Ruby

# NODE -> contains a value and a pointer to (next_node)
class Node

  attr_accessor :value, :next_node

  def initialize(val, next_in_line)
      @value = val
      @next_node = next_in_line
      # puts "Initialized a Node with value:  " + value.to_s
  end

end
