# Write push(element), pop, and empty? functions.
class MyStack

  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(element)
    #INCREMENT the stack position index by 1
    #ASSIGN element to the location at the stack position index
    @stack.push(element)
  end

  def pop()
    #ASSIGN the element at the stack position index to temp
    temp = @stack.last
    #DECREMENT the stack position index by 1
    @stack.pop()
    #RETURN temp
    return temp
  end

  #The empty? function returns false if one or more elements remain in the structure.
  def empty?()
    return @stack.empty?
  end
end
