class Hash

  attr_accessor :array

  def initialize
    @array = []
  end

  # 1) Use a hashing function to generate unique, fixed-length hash codes.
  #    Write the MurmurHash yourself or design your own hashing function.
  def murmur_hash

  end

  # 2) Expand the internal array to a prime number nearest the next
  #    power of 2 when you detect a collision, then reinsert all values.
  def new_size(size)
  end

  # 3) Create insertion(my_hash[key] = value) and lookup(value = my_hash[key])
  #     functions by overriding the respective operators.
  def insertion(my_hash[key] = value)
  end

  def lookup(value = my_hash[key])
    # key % length/size = location in array

    # examples:
    # 4221 % 20 = 1
    # 1357 % 20 = 17
    # 4612 % 20 = 12
    # 1514 % 20 = 14
  end

  # 4) Store each key and value pair as one element in the array.

end
