=begin
-Create a superclass called Vehicle for your MyCar class to inherit from 
-Move the behavior that isn't specific to the MyCar class to the superclass 
-Create a constant in your MyCar class 
-Store information about the vehicle that makes it different from other types of Vehicles.

-create a new class called MyTruck
-that inherits from your superclass 
-that also has a constant defined that separates it from the MyCar class in some way.
=end

# class Vehicle 

#   attr_accessor :color
#   attr_reader :year, :model

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You have pushed the gas and accelerated #{number} mph."
#   end 

#   def brake(number)
#     @current_speed -= number
#     puts "You have pushed the brake and decelerated #{number} mph."
#   end 

#   def current_speed
#     puts "You are going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have turned off the engine."
#   end

#   def self.miles_per_gallon(miles, gallons)
#     puts "#{miles / gallons} miles per gallon."
#   end 
# end 

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s 
#     "My car is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# class MyTruck < Vehicle 
#   NUMBER_OF_DOORS = 2

#   def to_s 
#     "My truck is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# tony = MyCar.new(1977, "Black", "Toyota")
# rhonda = MyTruck.new(2003, "Blue", "Chevy")

# puts tony.to_s
# puts rhonda.to_s

=begin

-Add a class variable to your superclass 
-that can keep track of the number of objects created that inherit from the superclass. 
-Create a method to print out the value of this class variable as well.

=end

# class Vehicle 
#   @@num_of_subclass_objects = 0

#   attr_accessor :color
#   attr_reader :year, :model

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@num_of_subclass_objects += 1
#   end

#   def print_number_of_objects
#     p @@num_of_subclass_objects
#   end 

#   def spray_paint(color)
#     self.color = color
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You have pushed the gas and accelerated #{number} mph."
#   end 

#   def brake(number)
#     @current_speed -= number
#     puts "You have pushed the brake and decelerated #{number} mph."
#   end 

#   def current_speed
#     puts "You are going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have turned off the engine."
#   end

#   def self.miles_per_gallon(miles, gallons)
#     puts "#{miles / gallons} miles per gallon."
#   end 
# end 

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s 
#     "My car is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# class MyTruck < Vehicle 
#   NUMBER_OF_DOORS = 2

#   def to_s 
#     "My truck is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# tony = MyCar.new(1977, "Black", "Toyota")
# tony.print_number_of_objects

# rhonda = MyTruck.new(2003, "Blue", "Chevy")
# rhonda.print_number_of_objects

=begin

-Create a module 
-that you can mix in to ONE of your subclasses 
-that describes a behavior unique to that subclass.

=end

# module Stickshiftable
#   def stick 
#     "We use stick to drive this vehicle."
#   end 
# end

# class Vehicle 
#   @@num_of_subclass_objects = 0

#   attr_accessor :color
#   attr_reader :year, :model

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@num_of_subclass_objects += 1
#   end

#   def print_number_of_objects
#     p @@num_of_subclass_objects
#   end 

#   def spray_paint(color)
#     self.color = color
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You have pushed the gas and accelerated #{number} mph."
#   end 

#   def brake(number)
#     @current_speed -= number
#     puts "You have pushed the brake and decelerated #{number} mph."
#   end 

#   def current_speed
#     puts "You are going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have turned off the engine."
#   end

#   def self.miles_per_gallon(miles, gallons)
#     puts "#{miles / gallons} miles per gallon."
#   end 
# end 

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s 
#     "My car is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# class MyTruck < Vehicle 
#   include Stickshiftable

#   NUMBER_OF_DOORS = 2

#   def to_s 
#     "My truck is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# tony = MyCar.new(1977, "Black", "Toyota")
# rhonda = MyTruck.new(2003, "Blue", "Chevy")

# puts rhonda.stick

=begin

-Print to the screen your method lookup for the classes that you have created.

=end

# module Stickshiftable
#   def stick 
#     "We use stick to drive this vehicle."
#   end 
# end

# class Vehicle 
#   @@num_of_subclass_objects = 0

#   attr_accessor :color
#   attr_reader :year, :model

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@num_of_subclass_objects += 1
#   end

#   def print_number_of_objects
#     p @@num_of_subclass_objects
#   end 

#   def spray_paint(color)
#     self.color = color
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You have pushed the gas and accelerated #{number} mph."
#   end 

#   def brake(number)
#     @current_speed -= number
#     puts "You have pushed the brake and decelerated #{number} mph."
#   end 

#   def current_speed
#     puts "You are going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have turned off the engine."
#   end

#   def self.miles_per_gallon(miles, gallons)
#     puts "#{miles / gallons} miles per gallon."
#   end 
# end 

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s 
#     "My car is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# class MyTruck < Vehicle 
#   include Stickshiftable

#   NUMBER_OF_DOORS = 2

#   def to_s 
#     "My truck is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# tony = MyCar.new(1977, "Black", "Toyota")
# rhonda = MyTruck.new(2003, "Blue", "Chevy")

# puts Vehicle.ancestors
# puts ""
# puts MyCar.ancestors
# puts ""
# puts MyTruck.ancestors

# =begin 
# -Move all of the methods from the MyCar class 
# -that also pertain to the MyTruck class 
# -into the Vehicle class

# -Make sure that all of your previous method calls are working when you are finished.
# =end

# module Stickshiftable
#   def stick 
#     "We use stick to drive this vehicle."
#   end 
# end

# class Vehicle 
#   attr_accessor :color
#   attr_reader :year, :model
#   @@num_of_subclass_objects = 0

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@num_of_subclass_objects += 1
#   end

#   def print_number_of_objects
#     @@num_of_subclass_objects
#   end 

#   def spray_paint(color)
#     self.color = color
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You have pushed the gas and accelerated #{number} mph."
#   end 

#   def brake(number)
#     @current_speed -= number
#     puts "You have pushed the brake and decelerated #{number} mph."
#   end 

#   def current_speed
#     puts "You are going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have turned off the engine."
#   end

#   def self.miles_per_gallon(miles, gallons)
#     puts "#{miles / gallons} miles per gallon."
#   end 

# end 

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s 
#     "My car is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# class MyTruck < Vehicle 
#   include Stickshiftable
#   NUMBER_OF_DOORS = 2

#   def to_s 
#     "My truck is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# tony = MyCar.new(1977, "Black", "Toyota")
# rhonda = MyTruck.new(2003, "Blue", "Chevy")
# tony.speed_up(20)
# tony.current_speed
# tony.speed_up(20)
# tony.current_speed
# tony.brake(20)
# tony.current_speed
# tony.brake(20)
# tony.current_speed
# tony.shut_off
# MyCar.miles_per_gallon(13, 351)
# tony.spray_paint("red")
# puts tony
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors


=begin 
-Move all of the methods from the MyCar class 
-that also pertain to the MyTruck class 
-into the Vehicle class

-Make sure that all of your previous method calls are working when you are finished.
=end

=begin 
-Write a method called age 
-that calls a private method
-to calculate the age of the vehicle. 

-Make sure the private method 
-is not available from outside of the class. -You'll need to use Ruby's built-in Time class to help.
=end

# module Stickshiftable
#   def stick 
#     "We use stick to drive this vehicle."
#   end 
# end

# class Vehicle 
#   attr_accessor :color
#   attr_reader :year, :model
#   @@num_of_subclass_objects = 0

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@num_of_subclass_objects += 1
#   end

#   def print_number_of_objects
#     @@num_of_subclass_objects
#   end 

#   def spray_paint(color)
#     self.color = color
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You have pushed the gas and accelerated #{number} mph."
#   end 

#   def brake(number)
#     @current_speed -= number
#     puts "You have pushed the brake and decelerated #{number} mph."
#   end 

#   def current_speed
#     puts "You are going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have turned off the engine."
#   end

#   def self.miles_per_gallon(miles, gallons)
#     puts "#{miles / gallons} miles per gallon."
#   end 

#   def age
#     "Your vehicle is #{calculate_age} years old."
#   end 

#   private 

#   def calculate_age
#     Time.now.year - self.year
#   end
# end 

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s 
#     "My car is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# class MyTruck < Vehicle 
#   include Stickshiftable
#   NUMBER_OF_DOORS = 2

#   def to_s 
#     "My truck is a #{self.year}, #{self.color}, #{self.model}."
#   end
# end

# tony = MyCar.new(1977, "Black", "Toyota")
# rhonda = MyTruck.new(2003, "Blue", "Chevy")

# puts tony.age


=begin
-Create a class 'Student' 
-with attributes name and grade. 
-Do NOT make the grade getter public
-so joe.grade will raise an error. 

-Create a better_grade_than? method, 
-that you can call like so...

puts "Well done!" if joe.better_grade_than?(bob)
=end

# class Student 
#   attr_accessor :name
#   attr_writer :grade

#   def initialize(name, grade)
#     self.name = name
#     self.grade = grade
#   end 
  
#   def better_grade_than?(other_instance)
#     self.grade > other_instance.grade
#   end
  
#   protected 

#   attr_reader :grade
# end

# joe = Student.new("Joe", 98)
# bob = Student.new("Bob", 64)

# puts "Well done!" if joe.better_grade_than?(bob)
