require_relative 'my_queue' # relative custom Entry class

# Use two MyQueue objects to implement push(element), pop, and empty? functions.
class QueueStack
  attr_accessor :q1, :q2

  def initialize
    @q1 = MyQueue.new
    @q2 = MyQueue.new
  end


  def push(element)
    #enqueue in queue2
    @q1.enqueue(element)
  end

  def pop
    #while size of queue1 is bigger than 1, pipe dequeued items from queue1 into queue2
    $i = @q1.list.length
    while $i > 1  do
      @q2.enqueue(@q1.list[$i])
      $i -= 1
    end
    #dequeue and return the last item of queue1
    return @q1.dequeue()
    #then switch the names of queue1 and queue2
    @q1, @q2 = @q2, @q1 # switch names
  end

end

# make an object
# Objects are created on the heap
test = QueueStack.new

test.push("1")
test.push("2")
test.push("3")
test.pop()
puts "q1: #{test.q1.list}."
puts "q2: #{test.q2.list}."


# q1 = 1
# q2 = []
#
# q1 = [12]
# q2 = []
