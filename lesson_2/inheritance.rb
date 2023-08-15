# -------------------
# Create a sub-class from Dog called Bulldog 
# overriding the swim method to return #"can't swim!"

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim 
#     "can't swim!"
#   end 
# end 

# teddy = Bulldog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# -------------------
# Create a new class called Cat,
# which can do everything a dog can,
# except swim or fetch.
# Assume the methods do the exact same thing. 
# Hint: don't just copy and paste all methods in Dog into Cat; #try to come up with some class hierarchy.

# class Pet 
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end

# end 
# class Dog < Pet
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# class Cat < Pet
#   def speak 
#     "meow!"
#   end
# end 

# class Bulldog < Dog
#   def swim 
#     "can't swim!"
#   end 
# end 

# pete = Pet.new
# kitty = Cat.new
# dave = Dog.new
# bud = Bulldog.new

# puts pete.run                # => "running!"
# # puts pete.speak              # => NoMethodError

# puts kitty.run               # => "running!"
# puts kitty.speak             # => "meow!"
# # puts kitty.fetch             # => NoMethodError

# puts dave.speak              # => "bark!"

# puts bud.run                 # => "running!"
# puts bud.swim                # => "can't swim!"

# -------------------
# Using the following code,
# create two classes - Truck and Car -
# that both inherit from Vehicle.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# end 

# class Car < Vehicle
# end 


# truck1 = Truck.new(1994)
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year

# -------------------
# Change the following code
# so that creating a new Truck 
# automatically invokes #start_engine.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     self.start_engine
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# -------------------
# Using the following code,
# allow Truck to accept a second argument upon instantiation.  # Name the parameter bed_type 
# and implement the modification so that Car 
# continues to only accept one argument.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   attr_reader :bed_type

#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# car1 = Car.new(1990)
# puts truck1.year
# puts truck1.bed_type

# puts car1.year

# -------------------
# Given the following code,
# modify #start_engine in Truck
# by appending 'Drive fast, please!'
# to the return value of #start_engine in Vehicle.
# The 'fast' in 'Drive fast, please!' 
# should be the value of speed.

# class Vehicle
#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   def start_engine(speed)
#     super() + " Drive #{speed}, please!" 
#   end
# end

# truck1 = Truck.new
# puts truck1.start_engine('fast')

# -------------------
# Using the following code,
# create a Towable module 
# that contains a method named tow
# that prints I can tow a trailer! when invoked.
# Include the module in the Truck class.

# module Towable
#   def tow 
#     puts "I can tow a trailer!"
#   end
# end

# class Truck
#   include Towable
# end

# class Car
# end

# truck1 = Truck.new
# truck1.tow

# -------------------
# Using the following code,
# create a class named Vehicle
# that, upon instantiation,
# assigns the passed in argument to @year.
# Both Truck and Car should inherit from Vehicle.

# module Towable
#   def tow
#     'I can tow a trailer!'
#   end
# end

# class Vehicle
#   attr_reader :year 

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# -------------------
# Using the following code,
# determine the lookup path used
# when invoking cat1.color.
# Only list the classes that were checked by Ruby 
# when searching for the #color method.

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# cat1.color #=> [Cat, Animal]

# -------------------
# Using the following code,
# determine the lookup path used
# when invoking cat1.color.
# Only list the classes and modules
# that Ruby will check
# when searching for the #color method.

# class Animal
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new
# cat1.color

# -------------------
# Using the following code,
# determine the lookup path used
# when invoking bird1.color.
# Only list the classes or modules
# that were checked by Ruby
# when searching for the #color method.

# module Flyable
#   def fly
#     "I'm flying!"
#   end
# end

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
#   include Flyable
# end

# bird1 = Bird.new('Red')
# bird1.color

# -------------------
# Create a module named Transportation
# that contains three classes: Vehicle, Truck, and Car.
# Truck and Car should both inherit from Vehicle.

# module Transportation
#   class Vehicle
#   end 

#   class Truck < Vehicle
#   end 

#   class Car < Vehicle
#   end
# end

# truck1 = Transportation::Truck.new
# car1 = Transportation::Car.new

class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

self = Dog.new("rex")
self.change_nickname("barny") # changed nickname to "barny"
puts self.greeting # Displays: Barny says Woof Woof!
