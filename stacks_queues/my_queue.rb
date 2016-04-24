# Write enqueue(element), dequeue, and empty? functions.
class MyQueue

  attr_accessor :list

  def initialize
    @list = []
  end

  def enqueue(element)
    # Add element to the end of the list
    @list.push(element)
  end

  def dequeue()
    # SET temp to the first element
    temp = @list[0]
    # Left-Shift the list by one entry
    @list.shift
    # RETURN temp
    return temp
  end

  #The empty? function returns false if one or more elements remain in the structure.
  def empty?
    return @list.empty?
  end
end
