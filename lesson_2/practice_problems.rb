=begin 
Easy 1

Question 1:

Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

1. true
2. "hello"
3. [1, 2, 3, "happy days"]
4. 142

All of the above are objects in Ruby. You can find out the class of each one by calling .class on the object directly. 

Question 2:

If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed 
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

puts Car.new.go_fast
puts Truck.new.go_fast

Question 3:

In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

Question 4:

If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

frankie = Angry.new

Question 5:

Which of these two classes would create objects that would have an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

veggie = Pizza.new("healthy")
orange = Fruit.new("orange")

p veggie.instance_variables 
p orange.instance_variables

Question 6:

What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

By default it will return the object class and encoded object id. You can also refer to the Ruby Documentation.

Question 7:

You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

Question 8:

In the name of the cats_count method we have used self. What does self refer to in this context?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Question 9:

If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end
=end

#----------------------------------------------------------

=begin  
Easy 2

Question 1:

You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future


We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

Question 2:

We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

Question 3:

How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

What is the lookup chain for Orange and HotSauce?

Orange => [Orange, Taste, Object, Kernel, BasicObject]
HotSauce => [HotSauce, Taste, Object, Kernel, BasicObject]

Question 4:

What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

Question 5: 

There are a number of variables listed below. What are the different types and how do you know which is which?

excited_dog = "excited dog" / local variable
@excited_dog = "excited dog" / instance variable (denoted by @)
@@excited_dog = "excited dog" / class variable (denoted by the @@)

Question 6:

Which one of these is a class method (if any) and how do you know? How would you call a class method?

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Television.manufacturer

Question 7:

Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

puts Cat.cats_count

Question 8:

What can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

Question 9:

What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play 
    "Bingo!"
  end
end

Question 10:

What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

-DRY's up code (Don't Repeat Yourself)
-Allows you to create custom objects from custom classes
-Override built in ruby methods such as to_s 
-It allows you to have collaborator objects
-Helps write cleaner code that shows distinct relationships between classes and their objects 
-You can share the same behaviors with objects from various classes by mixing them in with modules or by using inheritance
-Creates more human readable and easy to maintain code 
-Allows you to group similar classes under one module through the use of namespacing
-Enables you to optimize your code
-Leaves little room for error by relying on various pieces of code and classes rather than one giant unorganized code source
=end

#----------------------------------------------------------

=begin
Easy 3  

Question 1:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

What happens in each of the following cases:

hello = Hello.new
hello.hi

hello = Hello.new
hello.bye

hello = Hello.new
hello.greet

hello = Hello.new
hello.greet("Goodbye")

Hello.hi

Question 2:

If we call Hello.hi we get an error message. How would you fix this?

class Greeting
  def greet(message)
    puts message
  end

  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi 
    greet("Hello")
  end 
  
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

Question 3:

When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

lulu = AngryCat.new(13, "Lulu")
frankie = AngryCat.new(11, "Frankie")

Question 4:

Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

class Cat
  def initialize(type)
    @type = type
  end

  def to_s 
    "I am a #{@type} cat"
  end
end

lulu = Cat.new("tabby")

puts lulu

Question 5:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer => NoMethod Error 
tv.model

Television.manufacturer
Television.model => NoMethod Error 

Question 6:

In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

lulu = Cat.new("tabby")
lulu.make_one_year_older
puts lulu.age

Question 7:

What is used in this class but doesn't add any value?

class Light
  **attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    **return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
=end

#----------------------------------------------------------

=begin 
Medium 1

Question 1:

Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?

Question 2:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

doc = InvoiceEntry.new("doc", 2)
doc.update_quantity(4)
puts doc.quantity

Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

Can you spot the mistake and how to address it?

Question 3:

In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?

Question 4:

Let's practice creating an object hierarchy.

Create a class called Greeting with a single instance method called greet that takes a string argument and prints that argument to the terminal.

Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting 
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello") 
  end
end

class Goodbye < Greeting
  def bye 
    greet("Goodbye")
  end
end

hello = Hello.new
goodbye = Goodbye.new

puts hello.hi 
puts goodbye.bye

Question 5:

Write additional code for KrispyKreme such that the puts statements will work as specified below.

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type 
    @glazing = glazing
  end

  def to_s
    return "Plain" if filling_type == nil && glazing == nil
    return "#{filling_type}" if glazing == nil
    return "Plain with #{glazing}" if filling_type == nil
    return "#{filling_type} with #{glazing}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
#   => "Plain"

puts donut2
#   => "Vanilla"

puts donut3
#   => "Plain with sugar"

puts donut4
#   => "Plain with chocolate sprinkles"

puts donut5
#   => "Custard with icing"

Question 6:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

What is the difference in the way the code works?

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

Question 7:

How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end
end
=end

#----------------------------------------------------------

=begin 
Hard 1

Question 1:

Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common information and calculations they were performing for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle. This is what their code looks like so far:

class WheeledVehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires. But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

# module Moveable
#   attr_accessor :speed, :heading

#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end 

# class WheeledVehicle
#   include Moveable 

#   def initialize(tire_array, km_traveled_per_liter,liters_of_fuel_capacity)
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
#   include Moveable 

#   def initialize
#     # @tires = [30,30,32,32]
#     super([30,30,32,32], 50, 25.0)
#   end
# end

# class Motorcycle < WheeledVehicle
#   include Moveable

#   def initialize
#     # @tires = [20,20]
#     super([20,20], 80, 8.0)
#   end
# end

# class Catamaran
#   include Moveable

#   attr_reader :propeller_count, :hull_count

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls 
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#   end
# end

# triumph = Motorcycle.new
# lucy = Auto.new
# betsy = Catamaran.new(2, 6, 80, 8.0)

# puts triumph.tire_pressure(0)
# triumph.inflate_tire(0, 10)
# puts triumph.tire_pressure(0)
# puts triumph.range 
# triumph.speed = "200 mph"
# puts triumph.speed
# triumph.heading = "Speed Twin"
# puts triumph.heading

# puts lucy.tire_pressure(0)
# lucy.inflate_tire(0, 10)
# puts lucy.tire_pressure(0)
# puts lucy.range 
# lucy.speed = "600 mph"
# puts lucy.speed
# lucy.heading = "BMW"
# puts lucy.heading

# puts betsy.range 
# betsy.speed = "1000 mph"
# puts betsy.speed
# betsy.heading = "Spirit"
# puts betsy.heading
# puts betsy.propeller_count
# puts betsy.hull_count

# puts Auto.ancestors
# puts "---------------"
# puts Motorcycle.ancestors
# puts "---------------"
# puts Catamaran.ancestors

Question 2:

Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

module Moveable
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end 

class WheeledVehicle
  include Moveable 

  def initialize(tire_array, km_traveled_per_liter,liters_of_fuel_capacity)
    @tires = tire_array
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # @tires = [30,30,32,32]
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # @tires = [20,20]
    super([20,20], 80, 8.0)
  end
end

class Seacraft
  include Moveable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers=1, num_hulls=1, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls 
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end

  def range
    (super) + 10
  end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft 
end

triumph = Motorcycle.new
lucy = Auto.new
betsy = Catamaran.new(2, 6, 80, 8.0)
louie = Motorboat.new(50, 10)

puts triumph.tire_pressure(0)
triumph.inflate_tire(0, 10)
puts triumph.tire_pressure(0)
puts triumph.range 
triumph.speed = "200 mph"
puts triumph.speed
triumph.heading = "Speed Twin"
puts triumph.heading

puts lucy.tire_pressure(0)
lucy.inflate_tire(0, 10)
puts lucy.tire_pressure(0)
puts lucy.range 
lucy.speed = "600 mph"
puts lucy.speed
lucy.heading = "BMW"
puts lucy.heading

puts betsy.range 
betsy.speed = "1000 mph"
puts betsy.speed
betsy.heading = "Spirit"
puts betsy.heading
puts betsy.propeller_count
puts betsy.hull_count

puts louie.range 
louie.speed = "50 mph"
puts louie.speed
louie.heading = "Pirates"
puts louie.heading
puts louie.propeller_count
puts louie.hull_count

puts Auto.ancestors
puts "---------------"
puts Motorcycle.ancestors
puts "---------------"
puts Catamaran.ancestors
puts "---------------"
puts Motorboat.ancestors

=end