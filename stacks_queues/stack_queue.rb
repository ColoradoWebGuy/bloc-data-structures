require_relative 'my_stack' # relative custom Entry class

# Use two MyStack objects to implement enqueue(element), dequeue, and empty? functions.
class StackQueue
  attr_accessor :inbox, :outbox

  def initialize
    @inbox = MyStack.new
    @outbox = MyStack.new
  end


  def enqueue(element)
    #enqueue in queue2
    @inbox.push(element)
  end

  def dequeue()
    if (@outbox.empty?())
        while (!@inbox.empty?())
           @outbox.push(@inbox.pop())
        end
    end
    return @outbox.pop()
  end

  def empty?()
    @inbox.empty? && @outbox.empty?
  end

end

test = StackQueue.new

test.enqueue("1")
test.enqueue("2")
test.enqueue("3")
test.dequeue()
puts "inbox: #{test.inbox.stack}."
puts "outbox: #{test.outbox.stack}."
