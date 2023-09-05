# class Person 
#   attr_accessor :last_name, :first_name

#   def initialize(first_name)
#     @first_name = first_name
#     @last_name = ''
#   end

#   def name=(full_name)
#     parts = full_name.split
#     self.first_name = parts[0]
#     self.last_name = parts[1]
#   end

#   def name
#     "#{first_name} #{last_name}" 
#   end

#   def to_s 
#     name 
#   end
# end

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# module Walkable 
#   def walk 
#     puts "Let's go for a walk!"
#   end
# end

# class Cat
#   include Walkable

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
# kitty.walk