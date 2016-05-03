class MyHash

    def array
        @array
    end

  def initialize
    @array = Array.new
  end

  def add(key, value)
    @array[hash(key)] = value
  end

  def get(key)
    @array[hash(key)]
  end

  def hash(key)
    index = 0
    chars = key.split('')
    chars.each do |char|
      index += char.ord
    end
    index
  end
end


hash = MyHash.new

hash.add('foo', 'bar')
p hash.array
hash.add('oofs', 'yolo')
p hash.array

puts hash.get('foo')
puts hash.get('oofs')
# => 'bar'
