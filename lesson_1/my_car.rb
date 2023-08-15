#add a class method to your myCar class
#that calculates the gas milage 
#miles per gallon of any car 

# class MyCar
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

#   def to_s 
#     "Your #{self.color} #{self.model} was made in the year #{self.year}."
#   end
# end

# ruby = MyCar.new(1989, "red", "AT178")
# # MyCar.miles_per_gallon(300, 15)

# puts ruby


class Person 
  attr_accessor :name
  def initialize(name)
    @name = name
  end

end 

bob = Person.new("Steve")
bob.name = "Bob"

puts bob.name