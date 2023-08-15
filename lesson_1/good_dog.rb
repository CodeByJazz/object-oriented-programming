#Instance Variables and Instance Methods

class GoodDog 
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h 
    self.weight = w
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end 

  def speak
    "#{self.name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h 
    self.weight = w
  end
  
  def info 
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self 
    self 
  end 
end

# sparky = GoodDog.new("Sparky", "5 feet", "345 lbs")
# p sparky.what_is_self

# sparky.change_info("Rex", "12 inches", "24 lbs")
# p sparky.what_is_self

# sparky.change_info("Spartacus", "12 inches", "4 lbs")
# puts sparky.info 

#Class Variables and Class Methods
# class GoodDog 
#   @@number_of_dogs = 0

#   def initialize 
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end 

#   def self.name=(n)

#   end 

#   puts self
# end 

# puts GoodDog.total_number_of_dogs 

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

#Constants

# class GoodDog 
#   DOG_YEARS = 7

#   attr_accessor :name, :age 

#   def initialize(n, a)
#     self.name = n
#     self.age = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{self.name} and it is #{self.age} in dogs years."
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age
# puts "#{sparky}"

#custom to_s method must return a string or else it uses the default to_s method (most likely returning the class name and object id)
# class Foo 
#   def to_s 
#     42 
#   end 
# end 

# foo = Foo.new
# puts foo 
# puts "foo is #{foo}"

# class Bar 
#   attr_reader :xyz
#   def initialize 
#     @xyz = { a: 1, b: 2}
#   end 

#   def to_s 
#     "I'm a Bar object!"
#   end 
# end 

# bar = Bar.new
# puts bar 
# puts bar.xyz
