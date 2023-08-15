# -------------------
# Correct the following program so it will work properly.
# Assume that the Customer and Employee classes
# have complete implementations; 

# just make the smallest possible change
# to ensure that objects of both types
# have access to the print_address method.

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

# -------------------
# Correct the following program so it will work properly.
# Assume that the Car class has a complete implementation;
# just make the smallest possible change
# to ensure that cars have access to the drive method.

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# -------------------
# Modify the House class so that the above program will work.
# You are permitted to define only one new method in House.

# class House
#   include Comparable
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end
  
#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# -------------------
# Write a class that will display:
# ABC
# xyz

# when the following code is run:

# class Transform
#   attr_reader :letters

#   def initialize(letters)
#     @letters = letters
#   end

#   def uppercase
#     letters.upcase 
#   end

#   def self.lowercase(letters)
#     letters.downcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

# -------------------
# What will the following code print?

# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata
# puts thing.dupdata

# -------------------
# Modify this code so it works.
# Do not make the amount in the wallet accessible
# to any method that isn't part of the Wallet class.

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected 

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)

# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# -------------------
# Write the classes and methods 
# that will be necessary to make this code run,
# and print the following output:

#P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# class Shelter
#   attr_reader :owners
#   def initialize 
#     @owners = {}
#   end 

#   def adopt(owner, pet)
#     owner.pets << [pet.type, pet.name]
#     owners[owner.name] ||= owner 
#   end

#   def print_adoptions
#     owners.each do |key, value|
#       puts "#{key} has adopted the following pets:"
#       value.pets.each do |pet|
#         puts "a #{pet[0]} named #{pet[1]}"
#       end
#     end
#   end
# end

# class Owner
#   attr_accessor :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def number_of_pets
#     pets.size
#   end
#   # def add_pet(pet)
#   #   @pets << pet
#   # end

#   # def print_pets 
#   #   puts pets
#   # end
# end

# class Pet
#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end

#   # def to_s 
#   #   "a #{type} named #{name}"
#   # end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)

# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)

# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets." 
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# -------------------
# You need to modify the code so that this works:
# mike = Person.new("Mike")
# mike.walk
# => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# => "Flash runs forward"
# You are only allowed to write one new method to do this.

# module Walkable 
#   def walk 
#     "#{name} #{gait} foward"
#   end 
# end 

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end


# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# mike = Person.new("Mike")
# puts mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# puts kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# puts flash.walk
# # => "Flash runs forward"

# -------------------
# Now that we have a Walkable module,
# we are given a new challenge.
# Apparently some of our users are nobility,
# and the regular way of walking simply isn't good enough.
# Nobility need to strut.

# We need a new class Noble 
# that shows the title and name
# when walk is called:

# module Walkable 
#   def walk 
#     "#{self} #{gait} foward"
#   end 
# end 

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end


# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# class Noble 
#   include Walkable 
#   attr_accessor :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end 
#   def to_s 
#     "#{title} #{name}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# byron = Noble.new("Byron", "Lord")
# puts byron.walk
# # => "Lord Byron struts forward"

# byron.name
# #=> "Byron"
# byron.title
# #=> "Lord"

# mike = Person.new("Mike")
# puts mike.walk
# # # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# puts kitty.walk
# # # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# puts flash.walk
# # # => "Flash runs forward"