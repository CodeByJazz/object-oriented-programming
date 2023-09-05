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

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# class House
#   include Comparable 

#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other_house)
#     price <=> other_house.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# class Transform
#   def initialize(letters)
#     @letters = letters
#   end

#   def uppercase
#     @letters.upcase
#   end

#   def self.lowercase(letters)
#     letters.downcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

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

# class Shelter 
#   attr_reader :owners

#   def initialize
#     @owners = []
#   end

#   def adopt(owner, pet)
#     owner.pets << pet
#     owners << owner unless owners.include?(owner)
#   end

#   def print_adoptions
#     owners.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"
#       owner.pets.each do |pet|
#         puts "a #{pet.type} named #{pet.name}"
#       end
#     end
#   end
# end

# class Owner
#   attr_reader :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def number_of_pets
#     pets.size
#   end
# end

# class Pet 
#   attr_reader :type, :name

#   def initialize(type, name) 
#     @type = type
#     @name = name
#   end
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
# # shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# module Walkable
#   def walk 
#     "#{name} #{gait} forward"
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

# module Walkable
#   def walk 
#     "#{name} #{gait} forward"
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

# class Noble 
#   include Walkable

#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name 
#     @title = title
#   end

#   def walk 
#     "#{title} #{super}"
#   end

#   private 

#   def gait 
#     "struts"
#   end
# end

# byron = Noble.new("Byron", "Lord")
# puts byron.walk
# puts byron.name
# puts byron.title
# # => "Lord Byron struts forward"
