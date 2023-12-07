# class Pet 
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end 
# end

# class Dog < Pet
#   def speak
#     "Woof!"
#   end
# end

# class Cat < Pet
#   def speak
#     "Meow!"
#   end
# end

# class Pet 
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end 

#   def to_s
#     "#{@name} is #{@age} years old."
#   end
# end

# class Dog < Pet
#   def speak
#     "Woof!"
#   end
# end

# class Cat < Pet
#   def speak
#     "Meow!"
#   end
# end

# lulu = Cat.new("Lulu", 12)
# rosco = Dog.new("Rosco", 2)
# puts lulu 
# puts rosco

# class Dog
#   def initialize(name, color) 
#     @name = name
#     @color = color
#   end
# end 

# class Bulldog < Dog
#   def initialize(name, color)
#     super
#   end
# end 

# class Yorkie < Dog
#   def initialize(name, color)
#     super
#   end
# end

# class Vehicle
#   def initialize(wheels, color)
#     @wheels = wheels
#     @color = color
#   end
# end 

# class Car < Vehicle
# end 

# class Motorcycle < Vehicle
# end

# class Truck < Vehicle
#   def initialize(wheels, color, bed_type)
#     super(wheels, color)
#     @bed_type = bed_type 
#   end
# end 

#Why does the .change_info method not work as expected here?
# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def speak
#     "#{name} says arf!"
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

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info      
# => Sparky weighs 10 lbs and is 12 inches tall

=begin
The `change_info` method in the `GoodDog` class does not work as expected because on lines 13-15 we do not prepend `self` to `name`, `age`, and `weight`. Ruby thinks that we are initializing 3 new local variables instead of calling the setter methods created by `attr_accessor` on line 2. Therefore, in order to fix this we must call the setter methods on lines 13-15 and pass in the appropriate arguments like so:  `self.name = n`, `self.height = h`, and `self.weight = w`.
=end


#What will the following code output?
# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts sound
#   end

#   def sound
#     "#{@name} says "
#   end
# end

# class Cow < Animal
#   def sound
#     super + "moooooooooooo!"
#   end
# end

# daisy = Cow.new("Daisy")
# daisy.speak

=begin 
The following code will output the string `’Daisy says moooooooooooo!’`. This is because `Cow` subclasses from the superclass `Animal`. When we invoke the `speak` method on `daisy` on line 22, Ruby will first look through the method lookup chain for a method called `speak`. It will first look in the `Cow` class. Since it doesn’t find it there, it will then look in the `Animal` class. The `speak` method in `Animal` calls `sound`. Ruby will then look for and invoke the `sound` method in the `Cow` class. This method calls `super` which invokes the `sound` method in the `Animal` class and returns the string `’#{@name} says’` with the value assigned to the instance variable `@name` interpolated into the string. Finally, we concatenate the return value of `super` with `“moooooooooooo!”` on line 17 and output the return value on line 7 using `puts`. 
=end

#What code snippet can replace the "omitted code" comment to produce the indicated result? 
# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     "#{@first_name} #{@last_name}"
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# puts mike.full_name # => 'Michael Garcia'

#The last line in the above code should return "A". Which method(s) can we add to the Student class so the code works as expected?
# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def change_grade(grade)
#     self.grade = grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# puts priya.grade # => "A"
 
#In the example above, why would the following not work?

# def change_grade(new_grade)
#   grade = new_grade
# end

=begin
The following `change_grade` method would not work because we did not prepend `self` to grade on line 2. Ruby will think we are creating a new local variable called `grade`, when what we really want is to call the setter method for the `grade` instance variable with the argument `new_grade`.
=end

#On which lines in the following code does self refer to the instance of the MeMyselfAndI class referenced by i rather than the class itself? Select all that apply.
# class MeMyselfAndI
#   p self

#   def self.me
#     p self
#   end

#   def myself
#     p self
#   end
# end

# i = MeMyselfAndI.new
# MeMyselfAndI.me
# i.myself

=begin
Line 8 refers to the instance of `MeMyselfAndI `referenced by `i`. Every other reference to self refers to the class `MeMyselfAndI`.
=end

#Given the below usage of the Person class, code the class definition.
# class Person 
#   attr_accessor :name

#   def initialize(name) 
#     @name = name
#   end
# end

# bob = Person.new('bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'

#Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

#Hint: let first_name and last_name be "states" and create an instance method called name that uses those states.
# class Person 
#   attr_reader :name, :first_name
#   attr_accessor :last_name

#   def initialize(first_name) 
#     @first_name = first_name
#     @last_name = ''
#     @name = name
#   end

#   def name 
#     "#{first_name} #{last_name}"
#   end
# end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

#Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
# class Person 
#   attr_accessor :last_name, :name, :first_name

#   def initialize(first_name) 
#     @first_name = first_name
#     @last_name = ''
#     @name = name
#   end

#   def name=(name)
#     parts = name.split
#     self.first_name = parts[0]
#     self.last_name = parts[1]
#   end

#   def name 
#     "#{first_name} #{last_name}"
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

#Using the class definition from step #3, let's create a few more people -- that is, Person objects.
#If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

# class Person 
#   attr_accessor :last_name, :name, :first_name

#   def initialize(first_name) 
#     @first_name = first_name
#     @last_name = ''
#     @name = name
#   end

#   def name=(name)
#     parts = name.split
#     self.first_name = parts[0]
#     self.last_name = parts[1]
#   end

#   def name 
#     "#{first_name} #{last_name}"
#   end
# end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# puts rob.name == bob.name

=begin    
We can compare the two person objects by calling `rob.name == bob.name`. This will check to see if the two values returned by the method calls are equal to each other. 
=end

#Let's add a to_s method to the class:

# class Person
#   # ... rest of class omitted for brevity

#   def to_s
#     name
#   end
# end
# #Now, what does the below output?
# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

=begin   
The code will output the string `"The person's name is: Robert Smith"`. This is because we defined our own `to_s` method and have overiiden the default `to_s` method provided by the `Object` class. String interpolation automacially calls `to_s`. Therefore, when we call `name` on line 5, we are invoking the `getter` method for `name` which returns the value assigned to the `@name` instance variable. We then output the string using the `puts` method call on line 10.
=end

#Create an empty class named Cat.

# class Cat 
# end

#Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.

# kitty = Cat.new

#The above code would work, but it is problematic. What is wrong with this code, and how can you fix it?
# class Wedding
#   attr_reader :guests, :flowers, :songs

#   def prepare(preparers)
#     preparers.each do |preparer|
#       case preparer
#       when Chef
#         preparer.prepare_food(guests)
#       when Decorator
#         preparer.decorate_place(flowers)
#       when Musician
#         preparer.prepare_performance(songs)
#       end
#     end
#   end
# end

# class Chef
#   def prepare_food(guests)
#     # implementation
#   end
# end

# class Decorator
#   def decorate_place(flowers)
#     # implementation
#   end
# end

# class Musician
#   def prepare_performance(songs)
#     #implementation
#   end
# end

# =begin 
# The code above is trying to use polymorphism, but does so incorrectly. The case statement relys on a specific object to make the appropriate method calls. However, polymorphism does not concern itself with the type of calling object, only that it has a method available for use with the same name and same number of arguments. We could fix the code by modifying it like below.
# =end

# class Wedding
#   attr_reader :guests, :flowers, :songs

#   def prepare(preparers)
#     preparers.each do |preparer|
#       preparer.prepare_wedding(self)
#     end
#   end
# end

# class Chef
#   def prepare_wedding(wedding)
#     prepare_food(wedding.guests)
#   end
  
#   def prepare_food(guests)
#     # implementation
#   end
# end

# class Decorator
#   def prepare_wedding(wedding)
#     decorate_place(wedding.flowers)
#   end

#   def decorate_place(flowers)
#     # implementation
#   end
# end

# class Musician
#   def prepare_wedding(wedding)
#     prepare_performance(wedding.songs)
#   end

#   def prepare_performance(songs)
#     #implementation
#   end
# end

# class Character
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name # => "Sir Gallant"
# p sir_gallant.speak # => "Sir Gallant is speaking."
# # What change(s) do you need to make to the above code in order to get the expected output?

# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"
# # Make the changes necessary in order for this code to return the expected values.

# class Person
#   def initialize(name)
#     @name = name
#   end
# end

# class Cat
#   def initialize(name, owner)
#     @name = name
#     @owner = owner
#   end
# end

# sara = Person.new("Sara")
# fluffy = Cat.new("Fluffy", sara)
#Identify all custom defined objects that act as collaborator objects within the code. 

=begin   
The custom object `sara` acts as a collaborator object within the code. On line 15, we pass in `sara` as the argument to the `new` method which calls the constructor method and assigns the object `sara` to the local variable `owner`. The instance variable `@owner` gets initialized and assigned the object referened by `owner`. The custom defined object `sara` of the `Person` class works in collaboration with the `fluffy` object of the `Cat` class. 
=end

# arr1 = [1, 2, 3]
# arr2 = [1, 2, 3]
# p arr1.object_id == arr2.object_id      # => ??

# sym1 = :something
# sym2 = :something
# p sym1.object_id == sym2.object_id      # => ??

# int1 = 5
# int2 = 5
# p int1.object_id == int2.object_id      # => ??
# What will the code above return and why?

=begin   
The code will return `false` on line 3. This is because the integer returned by the `object_id` method on `arr1` and `arr2` will be different. Although both variables reference the same value, they do not point to the objects.

The code on line 6 will return `true`. This is because symbols are unique, therefore, `sym1` and `sym2` point to the same object. The integers returned by the calls to `object_id` will be the same. 

The code on line 9 will return `true`. Similarly to symbols, integers are also unique. This means there can only be one of the same integer object. Therefore, the integers returned by the calls to `object_id` will be the same. 
=end

# class Person
#   def get_name
#     @name # the @name instance variable is not initialized anywhere
#   end
# end

# bob = Person.new
# bob.get_name                  # => ??
# What is the return value, and why?
=begin  
The return value of `@name`` is `nil`. This is because we never initialize the instance variable `@name` or assign it a value. Therefore, when we reference `@name` on line 3, we get the return value of `nil`.
=end

# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def initialize(name); end

#   def dog_name
#     "bark! bark! #{@name} bark! bark!"    
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name                       # => ??
# What will this return, and why?
=begin 
The code above will output the string `"bark! bark!  bark! bark!"`. This is because on line 7 we override the `initialize` method in the superclass `Animal` which would have initilaized the instance variable `@name`. Since we call the `Dog` class `initialize` method instead on line 7, `@name` on line 10 returns nil since `@name` was never initialized. The return value gets interpolated into the string which is why we get`"bark! bark!  bark! bark!"`. 
=end

# module Swim
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swim

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# teddy.swim                                  
# How do you get this code to return “swimming”? What does this demonstrate about instance variables?

=begin   
We could get this code to return `"swimming!"` by calling the `enable_swimming` method on the object `teddy`. The `swim` method will only return `"swimming!"`if `@can_swim` evaluates as `true`. Currently, `@can_swim` has not been initialized. Therefore, the reference to `@can_swim` on line 11 returns `nil` which evaluates as `false`. In order to initialize `@can_swim` and assign it the value `true`, we must first invoke the `enable_swimming` method on the `teddy` object. 
=end

# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# Vehicle.wheels                              # => ??

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# Motorcycle.wheels                           # => ??
# Vehicle.wheels                              # => ??

# class Car < Vehicle
# end

# Car.wheels                                  # => ??
# What would the above code return, and why?

=begin 
The code on line 9 would return the integer `4` because the `Vehicle` class method `self.wheels` defined on lines 4-6 returns the value of `@@wheels` which was assigned `4` on line 2. 

The code on line 15 would return the integer `2` because we reassigned a new value (`2`) to the class variable `@@wheels` on line 12. Subclasses have access to the class variables of a superclass and the state of those class variables are shared between all subclasses. Therefore on lines 16 and 21, the return value will also be the integer `2`
=end

# module Maintenance
#   def change_tires
#     "Changing #{WHEELS} tires."
#   end
# end

# class Vehicle
#   WHEELS = 4
# end

# class Car < Vehicle
#   include Maintenance
# end

# a_car = Car.new
# a_car.change_tires             
# Describe the error and provide two different ways to fix it.

=begin   
On line 16 we invoke the `change_tires` method on the object `a_car`. Since we've included the `Maintenance` module on line 12, Ruby invokes the `change_tires` instance method defined on lines 2-4. We reference the constant `WHEELS` in the string on line 3. When Ruby tries to resolve this constant it does not find it in the lexical scope of the reference, in the inheritance hierarchy, or main scope.

One way to fix this error would be to use the namespace resolution operator. 

Another way to fix this error would be to define an instance method called `wheels` in the Vehicle class that returns the value assigned to `WHEELS`. We could then call `wheels` on line 3 and interpolate the return value into the string using `"Changing #{wheels} tires."`
=end

# module Maintenance
#   def change_tires
#     "Changing #{Vehicle::WHEELS} tires."
#   end
# end

# class Vehicle
#   WHEELS = 4
# end

# class Car < Vehicle
#   include Maintenance
# end

# a_car = Car.new
# puts a_car.change_tires 


# module Maintenance
#   def change_tires
#     "Changing #{wheels} tires."
#   end
# end

# class Vehicle
#   WHEELS = 4
#   def wheels
#     WHEELS
#   end
# end

# class Car < Vehicle
#   include Maintenance
# end

# a_car = Car.new
# puts a_car.change_tires 

# class Person
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
  
#   def >(other_person)
#     age > other_person.age
#   end
# end

# bob = Person.new("Bob", 49)
# kim = Person.new("Kim", 33)
# puts "bob is older than kim" if bob > kim
# How can you make this code function? How is this possible?

=begin    
We can make this code function by creating our own custom `>` method. We can then implement the `>` method by comparing the return value of `kim.age` and `bob.age`. This is possible because we pass over the implementation of our custom `>` method to the `Integer#>` method when we compare our ages. 
=end

# my_hash = {a: 1, b: 2, c: 3}
# my_hash << {d: 4}  
# What happens here, and why?
=begin 
In the code above we try to append `{d: 4} into the hash referenced by `my_hash`. Unfortunately, a `<<` method does not exist for the `Hash` class.
=end

# class Team
#   attr_accessor :name, :members

#   def initialize(name)
#     @name = name
#     @members = []
#   end

#   def <<(person)
#     members.push person
#   end

#   def +(other_team)
#     members + other_team.members
#   end
# end

# we'll use the same Person class from earlier

# cowboys = Team.new("Dallas Cowboys")
# cowboys << Person.new("Troy Aikman", 48)

# niners = Team.new("San Francisco 49ers")
# niners << Person.new("Joe Montana", 59)
# dream_team = cowboys + niners               # what is dream_team?
# What does the Team#+ method currently return? What is the problem with this? How could you fix this problem?

=begin   
Currently `dream_team` references an array with all of the person objects from the `@members` array of the `cowboys` object and the `niners` object. The `Team#+` method currently returns an array. However, this does not follow the standards of what the `+` method should usually return which is the same object type of the caller and argument. This means that instead of returning an array we should return a new `Team` object. 

We could assign the return value to a temporary team object within the `+` method. Then we could assign the return value of `members + other_team.members` to the array referenced by `@members` of the temporary team. 
=end
# class Person
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
  
#   def >(other_person)
#     age > other_person.age
#   end
# end

# class Team
#   attr_accessor :name, :members

#   def initialize(name)
#     @name = name
#     @members = []
#   end

#   def <<(person)
#     members.push person
#   end

#   def +(other_team)
#     temp_team = Team.new("Temp Team")
#     temp_team.members = members + other_team.members
#     temp_team.members
#   end
# end

# we'll use the same Person class from earlier

# cowboys = Team.new("Dallas Cowboys")
# cowboys << Person.new("Troy Aikman", 48)

# niners = Team.new("San Francisco 49ers")
# niners << Person.new("Joe Montana", 59)
# dream_team = cowboys + niners  
# p dream_team

# class Cat
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
  
#   def rename(new_name)
#     name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name # "Sophie"
# kitty.rename('Chloe')
# p kitty.name # "Chloe"
# What is wrong with the code above? Why? What principle about getter/setter methods does this demonstrate?

=begin   
In the code above we try to use the `rename` instance method to assign the state of the `@name` instance variable to the string `Chloe` on line 14. This does not work as expected because we did not prepend `name` with `self` on line 8. Ruby thinks we are initializing a local variable instead of invoking the setter method for `@name` to assign a `new_name` to `@name`. 

This demonstrates the principle that you must prepend `self` each time you call the setter method within the class, even if it is private. 
=end  

# Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.
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

# Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.

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
# truck1.start_engine('fast')

# Expected output:

# Ready to go! Drive fast, please!



