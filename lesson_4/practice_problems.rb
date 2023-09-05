#---Easy 1---
# puts true.class
# puts "hello".class
# puts [1, 2, 3, "happy days"].class
# puts 142.class

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed

#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Car.new.go_fast
# Truck.new.go_fast

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# small_car = Car.new
# small_car.go_fast #I am a Car and going super fast!

=begin 
The string printed by the `go_fast` method includes the name of the type of vehicle we are using. This is because we call the `class` method on `self`, which references the calling object `small_car`. This will return the name of the class that the object was instantianted from which happens to be the `Car` class. 
=end

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# kitty = AngryCat.new

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# orange = Fruit.new("orange")
# pepperoni = Pizza.new("pepperoni")

# p orange.instance_variables
# p pepperoni.instance_variables

=begin  
Objects instantiated from the `Pizza` class would have an instance variable. Instance varibles are denoted with an `@` symbol. Currently there is only an `@name` instance variable in the Pizza#initialize method. 
=end

=begin   
The default return value of `to_s` when invoked on an object depends on the implentation of the method for the calling objects class. You could refer to the documentation or class definition to find out. 
=end

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

=begin   
`self` in the `Cat#make_one_year_older` method refers to the calling object or the instance that invokes the `Cat#make_one_year_older` method. We must use `self` when performing assignment on a instance variable within a class so that Ruby knows we are not initializing a local variable. 
=end

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

=begin   
`self` in the name of the `Cat::cats_count` method refers to `Cat`. Since this is a class method, it can only be called on the `Cat` class. 
=end

# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

# plastic = Bag.new("white", "plastic")

#---Easy 2---

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# oracle.predict_the_future

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# puts trip.predict_the_future

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange 
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# puts Orange.ancestors

# class BeesWax
#   attr_accessor :type

#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end

# excited_dog = "excited dog" # local varibale
# @excited_dog = "excited dog" # instance variable
# @@excited_dog = "excited dog" # class variable

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

=begin   
`Television::manufacturer` is a class method. We know this because the method definition is prepended with `self` which references the `Television` class. The only way to call this method is to call it using `Television.manufacturer`
=end

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# puts Cat.cats_count
# Cat.new("Tabby")
# Cat.new("Sphynx")
# Cat.new("Tuxedo")
# puts Cat.cats_count

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end

# puts Bingo.new.play

=begin 
Here are some of the benefits of using Object Oriented Programming in Ruby 
-Develop structure using inheritance hierarchy
-DRY up your code
-Demonstrate 'is-a' and 'has-a' relationships using classes and modules
-Optimize your code
-Made debugging much easier by having a structered codebase
=end

#---Easy 3---

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# hello = Hello.new
# hello.hi # "Hello"

# hello = Hello.new
# hello.bye # NoMethodError

# hello = Hello.new
# hello.greet # ArgumentError

# hello = Hello.new
# hello.greet("Goodbye") # "Goodbye"

# Hello.hi # NoMethodError

# class Greeting
#   def greet(message)
#     puts message
#   end
  
#   def self.greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end

#   def self.hi 
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.hi

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# lulu = AngryCat.new(12, "lulu")
# binkie = AngryCat.new(3, "binkie")

# class Cat
#   def initialize(type)
#     @type = type
#   end

#   def to_s 
#     "I'm a #{@type} cat"
#   end
# end

# kitty = Cat.new("tabby")
# puts kitty

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer #NoMethodError
# tv.model 

# Television.manufacturer 
# Television.model #NoMethodError

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def self.information
#     return "I want to turn on the light with a brightness level of super high and a color of green"
#   end
# end

#--- Medium 1 ---

# class BankAccount
#   attr_reader :balance

#   def initialize(starting_balance)
#     @balance = starting_balance
#   end

#   def positive_balance?
#     balance >= 0
#   end
# end


# class InvoiceEntry
#   attr_reader :product_name
#   attr_accessor :quantity

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     self.quantity = updated_count if updated_count >= 0
#   end
# end

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     quantity = updated_count if updated_count >= 0
#   end
# end

# class Greeting
#   def greet(message) 
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end 
# end

# class Goodbye < Greeting
#   def bye 
#     greet("Goodbye")
#   end
# end

# class KrispyKreme
#   def initialize(filling_type, glazing)
#     if filling_type == nil
#       @filling_type = "Plain"
#     else 
#       @filling_type = filling_type
#     end
  
#     @glazing = glazing
#   end

#   def to_s 
#     if @glazing == nil 
#       "#{@filling_type}"
#     else
#       "#{@filling_type} with #{@glazing}"
#     end
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   #=> "Plain"

# puts donut2
#   #=> "Vanilla"

# puts donut3
#   #=> "Plain with sugar"

# puts donut4
#   #=> "Plain with chocolate sprinkles"

# puts donut5
#   #=> "Custard with icing"

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     self.template
#   end
# end

# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def status
#     "I have a brightness level of #{brightness} and a color of #{color}"
#   end

# end

#--- Hard 1 ---

# module Drivable
#   attr_accessor :speed, :heading
#   attr_reader :fuel_capacity, :fuel_efficiency

#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class WheeledVehicle
#   include Drivable

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end

# class Auto < WheeledVehicle
#   def initialize
#     # 4 tires are various tire pressures
#     super([30,30,32,32], 50, 25.0)
#   end
# end

# class Motorcycle < WheeledVehicle
#   def initialize
#     # 2 tires are various tire pressures
#     super([20,20], 80, 8.0)
#   end
# end

# class Seacraft 
#   include Drivable

#   attr_reader :propeller_count, :hull_count

#   def initialize(num_propellers=1, num_hulls=1, km_traveled_per_liter, liters_of_fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#   end

#   def range 
#     super + 10
#   end
# end 

# class Catamaran < Seacraft
# end

# class Motorboat < Seacraft
# end

# # popeyes = Motorboat.new(25, 10)
# # puts popeyes.propeller_count
# # puts popeyes.hull_count
# # puts popeyes.fuel_efficiency
# # puts popeyes.fuel_capacity
# # puts popeyes.range 


# popeyes = Auto.new
# puts popeyes.fuel_efficiency
# puts popeyes.fuel_capacity
# puts popeyes.range 
