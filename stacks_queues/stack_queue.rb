require_relative 'my_queue' # relative custom Entry class

# Use two MyStack objects to implement enqueue(element), dequeue, and empty? functions.
class StackQueue < MyStack

  stackOne = new MyStack()
  stackTwo = new MyStack()

  stackOne.push("SomethingExciting");
  stackOne.pop
  stackOne.empty?

  stackTwo.push("Again");
  stackTwo.push("With");
  stackTwo.push("Something");
  stackTwo.push("New");
  stackTwo.pop
  stackTwo.empty?

  system "clear"
  puts stackOne
  puts stackTwo
end
