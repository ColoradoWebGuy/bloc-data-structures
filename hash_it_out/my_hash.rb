class MyHash

  attr_accessor :array

  def initialize
     @array = []
     @size = 5 # it's at 3 to check for collisions
  end

  # 1) Use a hashing function to generate unique, fixed-length hash codes.
  def hash(key)
    index = 0
    chars = key.split('')
    chars.each.with_index do |char, i|
      index = (i*char.ord + i*char.ord)
    end
    index = index % @size # make sure the new index is within the array size
    puts "Index: #{index}"

    if @array[index]
      puts "Uh oh - gotta fix this collision: index: #{index} @: #{@array[index]}"
      temp_array = []
      temp_array.push(*@array)
      puts "Temporary array :: #{temp_array}"

      # resize array with a new insert index
      resize()
      puts "New array is :: #{@array}."

      #rehash values with values from temp_array

      index = index % @size # update new index within the new array size
      puts "New INDEX is :: #{index}."
    end

    #return index
    index
  end

  # # 2) Expand the internal array to a prime number nearest the next
  # #    power of 2 when you detect a collision, then reinsert all values.
  def resize()
    puts "#{nearest_prime_next_to_power_of_2 @size} is the closest prime to the next power of 2 after #{@size}."
    #resize array
    expected_size = nearest_prime_next_to_power_of_2(@size)
    resized = @array[0, expected_size]
    resized << nil while resized.size < expected_size
    @array = resized #update array
    @size = expected_size # update previous size
  end

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

  def nearest_prime_next_to_power_of_2(num)
    return 0 if num <= 0
    exponent = Math.log2 num
    higher_power = 2**exponent.ceil
    next_prime = higher_power + 1
    while (!prime?(next_prime))
      next_prime += 1
    end
    return next_prime
  end

  def prime?(n)
    (2..n/2).none?{|i| n % i == 0}
  end

end


hash = MyHash.new

hash.insertion('foo', 'bar')
p hash.array
hash.insertion('oof', 'yolo')
p hash.array
hash.insertion('way', 'much')
p hash.array

# puts lotr_runtimes.lookup('foo')
# puts lotr_runtimes.lookup('oof')

# => 'bar'

# lotr_runtimes.insertion("The Lord of the Rings: The Fellowship of the Ring", "3 hours, 48 minutes")
# lotr_runtimes.insertion("The Lord of the Rings: The Two Towers","3 hours, 55 minutes")
#
# p lotr_runtimes.lookup('The Lord of the Rings: The Fellowship of the Ring')
