class MyHash

  attr_accessor :array

  def initialize
     @array = []
  end

  # 1) Use a hashing function to generate unique, fixed-length hash codes.
  def hash(key)
    index = 0
    chars = key.split('')
    chars.each.with_index do |char, i|
      index = (i*char.ord + i*char.ord)
    end
    index
  end

  # # 2) Expand the internal array to a prime number nearest the next
  # #    power of 2 when you detect a collision, then reinsert all values.
  # def new_size(size)
  # end

  # 3) Create insertion(my_hash[key] = value) by overriding the respective operators.
  def insertion(key, value)
    # 5) Store each key and value pair as one element in the array.
    # k = @array.length
    # if (k != 0)
    #   true_index = hash(key) % k
    # else
    #   true_index = hash(key)
    # end
    @array[hash(key)] = value
  end

  # 4) Create lookup (value = my_hash[key]) by overriding the respective operators.
  def lookup(key)
    @array[hash(key)]
  end

end


# lotr_runtimes = MyHash.new
#
# lotr_runtimes.insertion('foo', 'bar')
# lotr_runtimes.insertion('oof', 'yolo')
#
# puts lotr_runtimes.lookup('foo')
# puts lotr_runtimes.lookup('oof')
# # => 'bar'

# lotr_runtimes.insertion("The Lord of the Rings: The Fellowship of the Ring", "3 hours, 48 minutes")
# lotr_runtimes.insertion("The Lord of the Rings: The Two Towers","3 hours, 55 minutes")
#
# p lotr_runtimes.lookup('The Lord of the Rings: The Fellowship of the Ring')
