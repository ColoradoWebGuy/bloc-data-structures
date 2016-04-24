require_relative '../my_stack'

RSpec.describe MyStack do
  it 'should know when it is empty' do
    stack = MyStack.new

    expect(stack.empty?).to(be(true))
  end

  it 'should push items onto the stack' do
    stack = MyStack.new

    stack.push(:item1)

    expect(stack.empty?).to(be(false))
  end

  it 'should pop items off of the stack' do
    stack = MyStack.new

    stack.push(:item1)

    expect(stack.pop).to(be(:item1))
    expect(stack.empty?).to(be(true))
  end

  it 'should maintain LIFO priority' do
    stack = MyStack.new

    stack.push(:item1)
    stack.push(:item2)

    expect(stack.pop).to(be(:item2))
    expect(stack.pop).to(be(:item1))
  end
end
