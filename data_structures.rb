#*******************************************************************#
#********* A line of people at an amusement park ride **************#
#*******************************************************************#

# A line of people at an amusement park ride with an associative array
line_to_ride = [['Dave', 0], ['Paul', 1], ['Rachel', 0]] #=> [1, 2, 3, 4, 5, 6]

# SET line_to_ride to an empty array
# ASSIGN Dave to line_to_ride[0] with a fast pass of 0
# ASSIGN Paul to line_to_ride[1] with a fast pass of 1
# ASSIGN Rachel to line_to_ride[2] with a fast pass of 0

#or using a class like below
class LineToRideTracker
  @attr_accessor people
  @attr_accessor fastPasses

  def initialize
    people, fastPasses = [], []
  end
end


#*******************************************************************#
#***************** Pixels on a computer screen *********************#
#*******************************************************************#

# SET pixel_collection to an empty array
# ASSIGN 0,0,0 rbg color and 0,0 x/y values into a hash
# push hash into the pixel_collection array
pixel_collection = []
hash = { :r => 2, :g => 245, :b => 23, :x => 0, :y => 1 }
pixel_collection.push(hash)

# then using the find method, we can retrieve a specific hash
pixel_collection.find {|i| i[:r] == 0 and i[:g] == 0 and i[:b] == 0}
# => {:r=>0, :g=>0, :b=>0, :x=>0, :y=>0}

# or we can use a class like below
class Pixel
  @attr_accessor red, blue, green, xLocation, yLocation

  def initialize
    red, blue, green, xLocation, yLocation = [], [], [], [], []
  end
end

#*******************************************************************#
#*********** The geo-location of every person on Earth *************#
#*******************************************************************#
              # ---- same concept as the last one ---- #

# SET people to an empty array
# ASSIGN latitude, and longitude values - with an amount of people in
#     same spot into a hash to represent one square meter.
# push hash into the people_collection array
people_collection = []
hash = { :latitude => 4312, :longitude => 2345, :num_people => 2}
people_collection.push(hash)

# then using the find method, we can retrieve a specific hash
people_collection.find {|i| i[:latitude] == 4312 and i[:longitude] == 2345}[:num_people]
# => 2

# or we can use a class like below
class People
  @attr_accessor latitude, longitude, num_people

  def initialize
    latitude, longitude, num_people = [], [], []
  end
end
