class MyHash

  attr_accessor :array, :size

  def initialize
     @array = []
     @size = 5 # it's at 3 to check for collisions
  end

  # 1) Use a hashing function to generate unique, fixed-length hash codes.
  def hash(key)
    index = gen_hash_index(key) # make sure the new index is within the array size

    index = collision?(index, key)

    index #return index
  end

  def collision?(i, key)
    if @array[i]
      #puts "Uh oh - gotta fix this collision: index: #{index} @: #{@array[index]}"
      #resize array
      resize()
      #rehash existing values until no collisions
      rehash()
      # hash new key again
      i = gen_hash_index(key)
    end

    return i;
  end

	def rehash
    puts "********************* !!!!!!!!!! REHASHING !!!!!!!! **************************************"
    # create new_array
    new_array = []
    @array.each do |item|

      #rehash using existing items
      if (item)
        index = gen_hash_index(item.key)
        index = collision?(index, item.key)
        new_array[index] = MyBucket.new(item.key, item.value) # insert new hash
      end

    end
    puts "REHASHED with #{new_array} and a size of #{@size}"
    #rest array with new_array
		@array = new_array
	end

  def gen_hash_index(key)
    index = 0
    key.to_underscore! # strip any special characters, and snake case it
    chars = key.split('')
    #puts "Characters SPLIT!!! #{chars}"
    chars.each.with_index do |char, i|
      index = (i*char.ord + i*char.ord)
    end
    new_index = index % @size # make sure the new index is within the array size
    #puts "NewIndex: #{new_index} within size of #{@size}"
    new_index
  end

  # # 2) Expand the internal array to a prime number nearest the next
  # #    power of 2 when you detect a collision, then reinsert all values.
  def resize()
    #puts "#{nearest_prime_next_to_power_of_2 @size} is the closest prime to the next power of 2 after #{@size}."
    #resize array
    expected_size = nearest_prime_next_to_power_of_2(@size)
    #resized = @array[0, expected_size]
    #resized << nil while resized.size < expected_size
    #@array = resized #update array
    @size = expected_size # update previous size
  end

  # 3) Create insertion(my_hash[key] = value) by overriding the respective operators.
  def insertion(key, value)
    # 5) Store each key and value pair as one element in the array.
    newKey = hash(key)
    puts "********-- NEW KEY --******** ------------>>> #{newKey}"
    @array[newKey] = MyBucket.new(key, value)
  end

  # 4) Create lookup (value = my_hash[key]) by overriding the respective operators.
  def lookup(key)
    @array[hash(key)].value
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

class String
   def to_underscore!
     gsub!(/(.)([A-Z])/,'\1_\2')
     gsub!(/\s+/, "**")
     gsub!(/:+/, "__")
     downcase!
   end
end


class MyBucket
	attr_reader :value, :key

	def initialize(key, value)
		@key, @value = key, value
	end
end

# hash = MyHash.new
#
# hash.insertion('foo', 'bar')
# hash.insertion('oof', 'yolo')
# hash.insertion('way', 'much')
# p hash.array

lotr_runtimes = MyHash.new

lotr_runtimes.insertion("The Lord of the Rings: The Fellowship of the Ring", "3 hours, 48 minutes")
print " first run -------------------->>>>>>>>>>"
lotr_runtimes.array.each { |val|
  if val
    print "\n KEY: #{val.key} \n"
    print " VALUE: #{val.value} \n"
  end
}
puts "\n Length of the array: #{lotr_runtimes.size}"

lotr_runtimes.insertion("The Lord of the Rings: The Two Towers","3 hours, 55 minutes")
print "\n Second run -------------------->>>>>>>>>>"
lotr_runtimes.array.each { |val|
  if val
    print "\n KEY: #{val.key} \n"
    print " VALUE: #{val.value} \n"
  end
}
puts "\n Length of the array: #{lotr_runtimes.size}"

lotr_runtimes.insertion("The Lord of the Rings: The Return of the King","3 hours, 21 minutes")
print "\n Third run -------------------->>>>>>>>>>"
lotr_runtimes.array.each { |val|
  if val
    print "\n KEY: #{val.key} \n"
    print " VALUE: #{val.value} \n"
  end
}
puts "\n Length of the array: #{lotr_runtimes.size}"

lotr_runtimes.insertion("The Hobbit: An Unexpected Journey","3 hours, 2 minutes")
print "\n Fourth run -------------------->>>>>>>>>>"
lotr_runtimes.array.each { |val|
  if val
    print "\n KEY: #{val.key} \n"
    print " VALUE: #{val.value} \n"
  end
}
puts "\n Length of the array: #{lotr_runtimes.size}"

lotr_runtimes.insertion("The Hobbit: The Desolation of Smaug","3 hours, 7 minutes")
print "\n Fifth run -------------------->>>>>>>>>>"
lotr_runtimes.array.each { |val|
  if val
    print "\n KEY: #{val.key} \n"
    print " VALUE: #{val.value} \n"
  end
}
puts "\n Length of the array: #{lotr_runtimes.size}"

lotr_runtimes.insertion("The Hobbit: The Battle of Five Armies","2 hours, 44 minutes")
print "\n Sixth run -------------------->>>>>>>>>>"
lotr_runtimes.array.each { |val|
  if val
    print "\n KEY: #{val.key} \n"
    print " VALUE: #{val.value} \n"
  end
}
puts "\n Length of the array: #{lotr_runtimes.size}"

#p lotr_runtimes.lookup('The Hobbit: An Unexpected Journey')
# lotr_runtimes.array.each { |val|
#   if val
#     print "\n KEY: #{val.key} \n"
#     print " VALUE: #{val.value} \n"
#   end
# }
# #
