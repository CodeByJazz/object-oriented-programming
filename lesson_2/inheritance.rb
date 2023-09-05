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

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# bull = Bulldog.new
# puts bull.swim

# class Animal 
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end
# end 

# class Dog < Animal
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

# class Bulldog < Dog
#   def swim 
#     "can't swim!"
#   end
# end


# class Cat < Animal
#   def speak 
#     'meow!'
#   end
# end

# pete = Animal.new
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

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def initialize(year)
#     super
#     start_engine
#   end

#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

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
# puts truck1.year
# puts truck1.bed_type

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
# cat1.color
# # [Cat, Animal]

# class Animal
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new
# cat1.color
#[Cat, Animal, Object, Kernel, BasicObject]

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

#[Bird, Flyable, Animal]

# module Transportation 
#   class Vehicle 
#   end 

#   class Truck < Vehicle
#   end 

#   class Car < Vehicle
#   end 
# end

# bob = Transportation::Truck.new