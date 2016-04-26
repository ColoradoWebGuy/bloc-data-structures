require_relative '../stack_queue'

RSpec.describe StackQueue do
   it 'should know when it is empty' do
     queue = StackQueue.new

     expect(queue.empty?).to(be(true))
   end

   it 'should enqueue items in the queue' do
     queue = StackQueue.new

     queue.enqueue(:item1)

     expect(queue.empty?).to(be(false))
   end

   it 'should dequeue items from the queue' do
     queue = StackQueue.new

     queue.enqueue(:item1)

     expect(queue.dequeue).to(be(:item1))
     expect(queue.empty?).to(be(true))
   end

   it 'should maintain FIFO priority' do
     queue = StackQueue.new

     queue.enqueue(:item1)
     queue.enqueue(:item2)

     expect(queue.dequeue).to(be(:item1))
     expect(queue.dequeue).to(be(:item2))
   end
 end
