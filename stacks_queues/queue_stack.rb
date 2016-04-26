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
      @q2.enqueue(@q1.dequeue)
      $i -= 1
    end
    #dequeue and return the last item of queue1
    return_val = @q1.dequeue()
    #then switch the names of queue1 and queue2
    @q1, @q2 = @q2, @q1 # switch names
    return_val
  end

  def empty?
    @q1.empty? && q2.empty?
  end
end
