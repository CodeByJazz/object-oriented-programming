# -------------------
# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

# # You may assume that the input will always fit in your terminal window.
# class Banner
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+#{"-" * (@message.length + 2)}+"
#   end

#   def empty_line
#     "| #{" " * @message.length} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

# -------------------
# What output does this code print?
# Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# -------------------
# Complete this program so that it produces the expected output:
# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end
 
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# -------------------
# Complete this program so that it produces the expected output:

# class Book
#   attr_accessor :title, :author

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# -------------------
# Complete this program so that it produces the expected output:

# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end

#   def first_name=(first_name)
#     @first_name = first_name.capitalize
#   end

#   def last_name=(last_name)
#     @last_name = last_name.capitalize
#   end
# end

# person = Person.new('john', 'doe')
# puts person
# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# -------------------
# There is nothing technically incorrect about this class,
# but the definition may lead to problems in the future.
# How can this class be fixed to be resistant to future problems?

# class Flight

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# spirit = Flight.new("F190")
# puts spirit

# -------------------
# Fix the following code so it works properly:

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

# -------------------
# Write a class called Square 
# that inherits from Rectangle,
# and is used like this:

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(num)
#     super(num, num)
#   end

# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# -------------------
# Update this code so that when you run it,
# you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

# class Pet
#   attr_reader :name, :age, :color

#   def initialize(name, age, color)
#     @name = name
#     @age = age
#     @color = color
#   end
# end

# class Cat < Pet
#   def intialize(name, age, color)
#     super(name, age, color)
#   end 
  
#   def to_s 
#     "My cat #{name} is #{age} years old and has #{color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# -------------------
# Refactor these classes so they all use a common superclass,
# and inherit behavior as needed.

# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle
#   def wheels
#     4
#   end
# end

# class Motorcycle < Vehicle
#   def wheels
#     2
#   end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end

#   def wheels
#     6
#   end
# end

# henry = Truck.new("Ford", "F-150", "3000")
# jazz = Motorcycle.new("Triumph", "Speed Twin")
# ruby = Car.new("Volkswagon", "Bug")

# puts henry.payload
# puts henry.make
# puts henry.model
# puts henry
# puts henry.wheels

# puts jazz.make
# puts jazz.model
# puts jazz
# puts jazz.wheels

# puts ruby.make
# puts ruby.model
# puts ruby
# puts ruby.wheels
