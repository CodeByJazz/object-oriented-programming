#---Easy 1---
=begin 
All of the following are objects in Ruby. You can find out what class they belong to by calling the `class` method on each object.
=end
# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

=begin  
We can add the ability for `Car` and `Truck` objects to go fast by mixing-in the `Speed` module into each class using the `include` method. We can check if our `Car` and `Truck` objects can go fast by instantiating objects from both classes and invoking the `go_fast` method. 
=end

=begin   
The `go_fast` method calls the `class` method on `self` on line 3. `self` within an instance method refers to the calling object. Therefore, when we call `go_fast` on the `small_car` object, `Car` is returned by the `class` method since `small_car` is a `Car` object. 
=end

=begin 
We can create a new instance of the `AngryCat` class by calling the `new` method on the class `AngryCat`. This will instantiate a new object from the class `AngryCat`.
=end
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

=begin 
The `Pizza` class would create objects with a `@name` instance variable. We know this because instance variables are prepended with the `@` symbol. The variable inside of the `Fruit#initialize` method is a local variable. 
=end

=begin   
The default return value of the `to_s` method is the class of the calling object and its encoded object id. We could look at the Ruby documentation to find out. 
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
`self` when referenced inside of an instance method refers to the calling object. Therefore `self` on line 10, refers to the object that invokes the `Cat#make_one_year_older` method. 
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
`self` when prepended to a method name, refers to the class where the method has been defined. This means that `self.cats_counts` is the same as saying `Cat.cats_count`. We must use `self` when defining class methods. 
=end

# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

=begin   
We would need to call the `new` class method on `Bag` in order to create a new instance of the class. We would also have to pass the `new` method two arguments, a color and a material. 
=end

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

=begin    
The following code will return the string `"You will "` concatenated with a random string from the array on line 7. 
=end

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
# trip.predict_the_future

=begin   
The following code will return the string `"You will "` concatenated with one of the strings in the array returned by `RoadTrip#choices`. This is because `RoadTrip#choices` overrides the `Oracle#choices` method. 
=end

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

=begin   
You can find where Ruby will look for a method when it's called by looking at the method lookup path. You can find the method lookup path by calling the `ancestors` method on the class. 

The method lookup chain for `Orange` is: [Orange, Taste, Object, Kernel, BasicObject].
The method lookup chain for `HotSauce` is: [HotSauce, Taste, Object, Kernel, BasicObject].
=end

# class BeesWax
#   def initialize(type)
#     @type = type
#   end

#   def type
#     @type
#   end

#   def type=(t)
#     @type = t
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

=begin 
We could add an `attr_accessor` method to this class to simplify it and remove the `BeesWax#type` and `BeesWax#type=` method.
=end

# class BeesWax
#   attr_accessor :type 

#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

# excited_dog = "excited dog" #=> local variable
# @excited_dog = "excited dog" #=> instance variable
# @@excited_dog = "excited dog" #=> class variable

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

=begin    
`Television::self.manufacturer` is a class method. We know this because the method name is prepended with `self` on line 2. We can call a class method on the class itself like so: `Television.manufacturer`. 
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
The `@@cats_count` variable is used to track the number of objects instantiated from the `Cat` class. Each time a `Cat` object is instantiated the `Cat#initialize` method will be invoked and increment the value referenced by `@@cats_count` by `1` on line 7. We can test our theory by writing the following code.
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

# p Cat.cats_count
# lulu = Cat.new("Tabby")
# frankie = Cat.new("Tabby")
# p Cat.cats_count

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo
#   def rules_of_play
#     #rules of play
#   end
# end

=begin    
We can add `< Game` to the `Bingo` class definition on line 1. This would allow `Bingo` to inherit the `play` method from the `Game` class. The `<` symbol is used to signify that a subclass is inheriting from a superclass. 
=end

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

=begin   
If we added a `play` method to the `Bingo` class, the `Bingo#play` method would override the `Game#play` method. This is because when Ruby looks for a method to invoke, it will start in the class of the calling object. Therefore, any `Bingo` objects will use the `Bingo#play` method rather than the `Game#play` method. 
=end

=begin 
Object Oriented Programming is a programming paradigm that is used to better handle the complexity of large programs. Rather than relying on a single container of methods and data, OOP makes use of many containers that perform particular actions to make the program work as a whole. SOme of the benefits of OOP include allowing programers to think at a higher level of abstration by extracting nouns and creating classes from them. OOP also use many different dependencies rather than one which makes less room for error and debugging code much more efficent. 
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
# hello.hi # => "Hello"

# hello = Hello.new
# hello.bye # => "NoMethodError"

# hello = Hello.new
# hello.greet # => "ArgumentError"

# hello = Hello.new
# hello.greet("Goodbye") # => "Goodbye"

# Hello.hi # => "NoMethodError"

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

=begin   
We could fix the error message output when calling `Hello.hi` by creating a class method called `hi` in the `Hello` class.
=end

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

=begin
We can create two different instances of the `AngryCat` class by calling the `new` class method twice passing in two arguments. 
=end

=begin   
We could create a custom `Cat#to_s` method to override the `BasicObject#to_s` method. We can define our method so that it returns the string `"I am a #{@type} cat"`, by interpolating the return value of the `@type` instance variable into the string. 
=end

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer 
# tv.model

# Television.manufacturer
# Television.model

=begin
Line 2 will raise a `NoMethodError` exception. Line 3 will run as expected. Line 5 will also run as expected and line 6 will raise a `NoMethodError` exception. 
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
We could reference the `@age` instance variable directly instead of using self. However, it is standard practice to use the getter and setter methods whenever they are available to us. 
=end

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

=begin 
`return` is used in the `Light` class on line 10; however, this doesn't add any value. Since the return value will always be the last line of code in our methods, we do not need to use an explicit `return` statement. 
=end

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

=begin 
Ben is right in this scenario. Since we have an `attr_reader` on line 2, this creates the getter method for the `balance` instance variable. Therefore, we do not need to refer to the instance variable directly, we can reference it through our getter method by calling `balance`. 
=end

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     quantity = updated_count if updated_count >= 0
#   end
# end

=begin  
The code will fail when `InvoiceEntry#update_quantity` is called because on line 11, Ruby thinks we are initializing a new local variable. This is because we are missing the `@` prefix for `quantity`. We could fix this by changing it to `@quantity` on line 11, or we could add a setter method for `@quantity` and call the setter using `self.quantity=` on line 11. 
=end 

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

=begin   
Technically there is nothing wrong with adding `attr_accessor` and changing line 10 to `self.quantity=updated_count if updated_count >= 0`. However, in doing so, we have given the user access to modify and change the value referenced by the instance variables `@quantity` and `@product_name`. Its best to only use `attr_accessor` where needed. Therefore, if we don't need a setter for `@product_name` its best to just reference `@quantity` directly on line 10. 
=end

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

# Hello.new.hi
# Goodbye.new.bye

# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     return "Plain" if @filling_type == nil && @glazing == nil
#     return "#{@filling_type}" if @glazing == nil
#     return "Plain with #{@glazing}" if @filling_type == nil
#     "#{@filling_type} with #{@glazing}"
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   # => "Plain"

# puts donut2
#   # => "Vanilla"

# puts donut3
#   # => "Plain with sugar"

# puts donut4
#   # => "Plain with chocolate sprinkles"

# puts donut5
#   # => "Custard with icing"

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

=begin
The methods in both `Computer` classes function in the same way; however, we make use of the getter method defined by the `attr_accessor` method for `template` on line 9. When we call `self.template` we use the getter method to retrieve the value associated with the `@template` instance variable. It's not neccessary to use `self` here and it's best to avoid it where its not needed. 
=end

# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def light_status
#     "I have a brightness level of #{brightness} and a color of #{color}"
#   end

# end
=begin
We could change the method name `light_status` to `status`. This is because it's best not to use the name of the class when naming methods. We'll be invoking this method on instances of the class so it would be redundant to use the word `light` here. 
=end
# #--- Hard 1 ---
# module Drivable
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
#   include Drivable

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
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
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls
#   end

#   def range
#     super + 10 
#   end
# end

# class Motorboat < Seacraft; end

# class Catamaran < Seacraft; end

=begin   
+ Include 4 players (attacker, midfielder, defender, goalkeeper)

+ All the players’ jersey is blue, 

+ except the goalkeeper, his jersey is white with blue stripes

+ All players can run and shoot the ball.

+ Attacker should be able to lob the ball

+ Midfielder should be able to pass the ball

+ Defender should be able to block the ball

+ The referee has a whistle. He wears black and is able to run and whistle.
# =end 

# module Runnable
#   def run 
#     "runs!"
#   end
# end

# class Player 
#   include Runnable

#   def initialize
#     @jersey_color = "blue"
#   end

#   def shoot_ball
#     "shoots the ball!"
#   end
# end

# class Attacker < Player
#   def lob_ball
#     "lobs the ball!"
#   end
# end

# class Midfielder < Player
#   def pass_ball 
#     "passes the ball!"
#   end
# end

# class Defender < Player
#   def block_ball
#     "blocks the ball!"
#   end
# end 

# class Goalkeeper < Player
#   def initialize
#     @jersey_color = "white with blue stripes"
#   end
# end

# class Referee
#   include Runnable

#   def initialize
#     @whistle = true
#     @jersey_color = "black"
#   end

#   def whistle
#     "whistles!"
#   end
# end

=begin
+ Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers. 

+ A teacher teaches.

+ An assistant helps kids with any bathroom emergencies. 

+ Both teachers and assistants can help a student with schoolwork and watch them on the playground. 

+ Kids themselves can learn and play. 

+ A teacher and principle can supervise a class. 

+ Only the principle has the ability to expel a kid. 

+ Janitors have the ability to clean. 

+ Cafeteria workers have the ability to serve food.

- Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

# =end
# module Lunchable
#   def eat_lunch
#     "eats lunch!"
#   end
# end

# module Supervisable 
#   def supervise_class 
#     "supervises class!"
#   end
# end

# module Assistable 
#   def assist_with_schoolwork
#     "assists with schoolwork!"
#   end
# end

# module Watchable 
#   def watch_playground 
#     "watches playground!"
#   end
# end

# class Children 
#   include Lunchable

#   def learn 
#     "learning is fun!"
#   end 

#   def play 
#     "playing is even more fun!"
#   end
# end 

# class Teachers 
#   include Lunchable
#   include Supervisable
#   include Watchable
#   include Assistable

#   def teach
#     "I love teaching!"
#   end
# end

# class ClassAssistants 
#   include Lunchable
#   include Watchable
#   include Assistable

#   def bathroom_emergency
#     "Bathroom emergency!"
#   end
# end

# class Principle
#   include Lunchable
#   include Supervisable

#   def expel_child 
#     "You are expelled!"
#   end
# end

# class Janitors
#   include Lunchable

#   def clean
#     "Time to mop the floors!" 
#   end
# end

# class CafeteriaWorkers
#   include Lunchable

#   def serve_food
#     "Today's lunch is the best yet!"
#   end
# end

=begin
# There's a dental office called Dental People Inc. 
# Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
# Both general dentists and oral surgeons can pull teeth. 
# Orthodontists cannot pull teeth. 
# Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists. 
# All dentists graduated from dental school.  
# Oral surgeons place implants.
# General dentists fill teeth
# =end

# class DentalOffice
#   attr_accessor :dentists

#   def initialize(name)
#     @name = name
#     @dentists = []
#   end
# end

# class Dentist 
#   def initialize 
#     @graduated_dental_school = true
#   end

#   def pull_teeth 
#     "pulls teeth!"
#   end 
# end

# class OralSurgeon < Dentist
#   def place_implant
#     "places implants!"
#   end
# end

# class Orthodontist < Dentist
#   def pull_teeth
#     "does not pull teeth!"
#   end

# #   def straighten_teeth 
# #     "straightens teeth!"
# #   end
# # end

# # class GeneralDentist < Dentist
# #   def fill_teeth
# #     "fills teeth!"
# #   end
# # end

# # office = DentalOffice.new("Dental People Inc.")
# # office.dentists << GeneralDentist.new
# # office.dentists << OralSurgeon.new 
# # office.dentists << OralSurgeon.new 
# # office.dentists << Orthodontist.new
# # office.dentists << Orthodontist.new

# # p office
# =begin 
# # What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.



# # What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.

# # How do class inheritance and mixing in modules affect instance variable scope? Give an example.

# # What is encapsulation, and why is it important in Ruby? Give an example.

# # How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

# # When should we use class inheritance vs. interface inheritance?

# # What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?

# # What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.
# =end 
# def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# # What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def change_info(n, h, w)
#     name = n
#     height = h
#     weight = w
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info 
# # => Spartacus weighs 10 lbs and is 12 inches tall.

# # We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected? 

# module Swimmable
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swimmable

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# p teddy.swim   
=begin
# What is output and why? What does this demonstrate about instance variables?
=end
# ================================================================

# class Person
#   def initialize(name, job)
#     @name = name
#     @job = job
#   end 

#   def to_s 
#     "My name is #{@name} and I am a #{@job}"
#   end
# end

# roger = Person.new("Roger", "Carpenter")
# puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 


#Other than that don't change Person.
# Output:
# "My name is Roger and I am a Carpenter"


# ================================================================

# class Human 
#   attr_reader :name

#   def initialize(name="Dylan")
#     @name = name
#   end

#   def hair_colour(color)
#     "Hi, my name is #{name} and I have #{color} hair."
#   end

#   def self.hair_colour(name, color="blonde")
#     human = Human.new
#     "Hi, my name is #{human.name} and I have #{color} hair."
#   end
# end

# puts Human.new("Jo").hair_colour("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

# puts Human.hair_colour("")              
# Should "Hi, my name is Dylan and I have blonde hair."

# ================================================================

#describe what the code below outputs and why

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Characters
#   attr_accessor :name, :characters 
  
#   def initialize(name) 
#     self.name
#     @characters = [] 
#   end
  
#   def display
#     name
#   end
  
#   protected 

#   attr_reader :name
#   attr_writer :name
# end

# class Monster < Characters
#   include Attackable
  
#   def initialize(name)
#     super
#   end
# end

# class Barbarian < Characters
#   def ==(other)
#     if(super.self == super.self) # 
#       super.self == super.self
#     end
#   end
# end

# conan = Barbarian.new('barb') 
# rob = Monster.new('monst')
# conan.characters << rob
# p conan.display

# ================================================================

# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 
# class Monster
#   def attack
#     "attacks!"
#   end
# end

# class Barbarian 
#   def attack
#     "attacks!"
#   end
# end
    
# ================================================================

# Without adding any methods below, implement a solution

# class ClassA 
#   attr_reader :field1, :field2
  
#   def initialize(num)
#     @field1 = "xyz"
#     @field2 = num
#   end
# end

# class ClassB 
#   attr_reader :field1

#   def initialize
#     @field1 = "abc"
#   end
# end


# obj1 = ClassA.new(50)
# obj2 = ClassA.new(25)
# obj3 = ClassB.new


# p obj1.field2 > obj2.field2
# p obj2.field1 > obj3.field1

#=====================================================================
# class BenjaminButton 
#   attr_accessor :actual_age, :appearance_age

#   def initialize
#     @actual_age = 0 
#     @appearance_age = 100
#   end
  
#   def get_older
#     self.actual_age += 1
#     look_younger
#   end
  
#   def look_younger
#     self.appearance_age -= 1
#   end
  
#   def die
#     self.actual_age = 100
#     self.appearance_age = 0 
#   end
# end


# benjamin = BenjaminButton.new
# p benjamin.actual_age # => 0
# p benjamin.appearance_age # => 100

# benjamin.actual_age = 1
# p benjamin.actual_age # 1

# benjamin.get_older
# p benjamin.actual_age # => 2
# p benjamin.appearance_age # => 99

# benjamin.die
# p benjamin.actual_age # => 100
# p benjamin.appearance_age # => 0

#=====================================================================

# class Wizard
#   attr_reader :name, :hitpoints
  
#   def initialize(name, hitpoints)
#     @name = name
#     @hitpoints = hitpoints
#   end  
  
#   def fireball
#     "casts Fireball for 500 damage!"
#   end
# end

# class Summoner < Wizard
#   attr_reader :souls
  
#   def initialize(name, hitpoints)
#     super
#     @souls = []
#   end
  
#   def soul_steal(character)
#     @souls << character
#   end
# end

# gandolf = Summoner.new("Gandolf", 100)
# p gandolf.name # => "Gandolf"

# valdimar = Wizard.new("Valdimar", 200)
# p valdimar.fireball #=> "casts fireball for 500 damage!"

# p gandolf.hitpoints #=> 100

# p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

# p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"


#=====================================================================
# module Flightable
#   def fly
#     "I am #{name}, I am a superhero, and I can fly!"
#   end
# end

# class Superhero   
#   include Flightable

#   attr_accessor :ability
#   attr_reader :name
  
#   def self.fight_crime
#     p "I am #{self}!"
#     ability = Ability.new("coding skills")
#     announce_ability(ability)
#   end
  
#   def initialize(name)
#     @name = name
#   end
  
#   def self.announce_ability(ability)
#     puts "I fight crime with my #{ability.description} ability!"
#   end
# end

# class LSMan < Superhero; end

# class Ability
#   attr_reader :description

#   def initialize(description)
#     @description = description
#   end
# end

# superman = Superhero.new('Superman')

# p superman.fly # => I am Superman, I am a superhero, and I can fly!

# LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
#=====================================================================

