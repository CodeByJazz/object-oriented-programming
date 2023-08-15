# class Person 
#   attr_accessor :last_name, :first_name
#   attr_reader :name

#   def initialize(name)
#     @name = name
#     @first_name = name
#   end

#   def name 
#     "#{self.first_name} #{self.last_name}"
#   end 

#   def name=(full_name)
#     parts = full_name.split
#     self.first_name = parts.first
#     self.last_name = parts.last if parts.last != parts.first
#   end

#   def to_s
#     name
#   end 
# end 

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

# -------------------
# Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.

# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# -------------------
# Create an empty class named Cat.

# class Cat 
# end

# -------------------
# Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.

# class Cat 
# end

# kitty = Cat.new

# -------------------
# Using the code from the previous exercise, 
# add an #initialize method 
# that prints I'm a cat! 
# when a new Cat object is instantiated.

# class Cat 
#   def initialize
#     puts "I'm a cat!"
#   end
# end

# kitty = Cat.new

# -------------------
# Using the code from the previous exercise,
# add a parameter to #initialize
# that provides a name for the Cat object. 
# Use an instance variable 
# to print a greeting with the provided name. 
# (You can remove the code that displays I'm a cat!.)

# class Cat 
#   def initialize(name)
#     @name = name
#     puts "Hello! My name is #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')

# -------------------
# Using the code from the previous exercise,
# move the greeting from the #initialize method 
# to an instance method named #greet 
# that prints a greeting when invoked.

# class Cat 
#   def initialize(name)
#     @name = name
#   end

#   def greet 
#     puts "Hello! My name is #{@name}!"
#   end 
# end

# kitty = Cat.new('Sophie')
# kitty.greet 

# -------------------
# Using the code from the previous exercise, 
# add a getter method named #name 
# and invoke it in place of @name in #greet.

# class Cat 
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet 
#     puts "Hello! My name is #{name}!"
#   end 
# end

# kitty = Cat.new('Sophie')
# kitty.greet 

# -------------------
# Using the code from the previous exercise, 
# add a setter method named #name=. 
# Then, rename kitty to 'Luna' 
# and invoke #greet again.

# class Cat 
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet 
#     puts "Hello! My name is #{name}!"
#   end 
# end

# kitty = Cat.new('Sophie')
# kitty.greet 
# kitty.name = 'Luna'
# kitty.greet

# -------------------
# Using the following code, 
# create a module named Walkable
# that contains a method named #walk. 
# This method should print 'Let's go for a walk!' when invoked. # Include Walkable in Cat 
# and invoke #walk on kitty.

# module Walkable
#   def walk
#     puts "Let's go for a walk!"
#   end
# end


# class Cat 
#   include Walkable

#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet 
#     puts "Hello! My name is #{name}!"
#   end 
# end

# kitty = Cat.new('Sophie')
# kitty.greet 
# kitty.walk

