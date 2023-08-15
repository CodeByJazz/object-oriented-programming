#overriding superclass method with object instance methods

# class Animal
#   def speak 
#     "Hello!"
#   end 
# end

# class GoodDog < Animal 
#   attr_accessor :name

#   def initialize(n)
#     self.name = n 
#   end

#   def speak 
#     "#{self.name} says arf!"
#   end 
# end 

# class Cat < Animal 
# end 

# sparky = GoodDog.new("Sparky")
# paws = Cat.new 

# puts sparky.speak 
# puts paws.speak

#how to use the keyword super to invoke a method of the same name from a superclass, further up the method lookup chain

# class Animal 
#   def speak 
#     "Hello!"
#   end 
# end 

# class GoodDog < Animal
#   def speak 
#     super + " from GoodDog class"
#   end 
# end 

# sparky = GoodDog.new 
# puts sparky.speak

#super will also use the same arguments passed to the method of which it was called within, as the arguments to the superclass method it invokes

# class Animal 
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end 
# end 

# class GoodDog < Animal 
#   def initialize(color)
#     super 
#     @color = color
#   end 
# end 

# bruno = GoodDog.new("brown")
# p bruno

#specify which arguments to pass to the superclass method
# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end 
# end

# p BadDog.new(2, "bear")

#if there are no parameters deined in the superclass method super is invoking, always use a pair of empty parenthesis or else you'll get an ArgumentError

# class Animal 
#   def initialize
#   end 
# end 

# class Bear < Animal 
#   def initialize(color)
#     super()
#     @color = color 
#   end 
# end 

# bear = Bear.new("black")

# p bear

# Inhertiance vs. Mixing In Modules 
# module Swimmable 
#   def swim
#     "I'm swimming!"
#   end
# end 

# class Animal; end 

# class Fish < Animal
#   include Swimmable 
# end 

# class Mammal < Animal 
# end 

# class Cat < Mammal
# end 

# class Dog < Mammal 
#   include Swimmable 
# end 

# sparky = Dog.new 
# neemo = Fish.new 
# paws = Cat.new

# puts sparky.swim
# puts neemo.swim
# puts paws.swim

#The method lookup chain starts with the class from which the object or instace was instatntiated from. Next it looks at the "last" or most recent, module that was mixed in, up to the first. Then it looks to the superclass and lastly any modules that were mixed-in to the superclass, starting from the most recent up to the first. 

# module Walkable 
#   def walk 
#     "I'm walking."
#   end 
# end 

# module Swimmable
#   def swim
#     "I'm swimming." 
#   end 
# end 

# module Climbable 
#   def climb 
#     "I'm climbing."
#   end
# end 

# class Animal
#   include Walkable 

#   def speak 
#     "I'm an animal, and I speak!"
#   end 
# end 

# class GoodDog < Animal
#   include Swimmable 
#   include Climbable
# end 

# puts "---Animal method lookup---"
# puts Animal.ancestors

# fido = Animal.new
# puts fido.swim

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors

#We can use namespacing or include similar classes inside of a module to group related classes in our code. You can instatiate an object from within a module by appeneding the class name with two colons (::) to the module name.

# module Mammal
#   class Dog 
#     def speak(sound)
#       p "#{sound}"
#     end
#   end 

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end 
#   end 
# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak('Arf!')
# kitty.say_name('kitty')


# You can include "outlier" methods that don't really fit in with the rest of your code, inside of the module itself. You always want to prepend the method name with "self" and call it directly on the module.

# module Mammal
#   class Dog 
#     def speak(sound)
#       p "#{sound}"
#     end
#   end 

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end 
#   end 

#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end

# value = Mammal.some_out_of_place_method(4)
# puts value

#Any method defined below the "private" keyword in a class, can not be called with an object instantiated from said class. only the class itself, has access to the methods defined below "private".

class GoodDog 
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a 
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years 
    age * DOG_YEARS
  end 
end 

sparky = GoodDog.new("Sparky", 4)
sparky.public_disclosure

# Unlike private methods, "protected" methods can be invoked on other instances of the class from within the class itself. Meaning any object instantiated from said class can invoke a protected method from within the class. However, like private methods, the method can not be called on the object directly outside of the class. 

# class Person 
#   def initialize(age)
#     @age = age
#   end

#   def older?(other_person)
#     age > other_person.age
#   end

#   protected

#   attr_reader :age
# end 

# malory = Person.new(64)
# sterling = Person.new(42)

# malory.older?(sterling)
# sterling.older?(malory)

# puts malory.age


#You must be mindful when writing instance methods inside of classes. Class method take precedence over built in Object and superclass methods. "send" is an Object method that takes one argument, however, the class method send which takes no arguments, overrides the Object method we want to call. 

# class Parent 
#   def say_hi
#     p "Hi from Parent."
#   end 
# end 

# class Child
#   def say_hi 
#     p "Hi from Child."
#   end

#   def send 
#     p "send from Child..."
#   end
# end 

# child = Child.new
# child.say_hi

# son = Child.new 
# son.send :say_hi

# lad = Child.new 
# lad.send :say_hi

# Be careful when naming instance methods because you can easily override important methods and raise exceptions throughout your program. Unless it is intentional, you do NOT want to do this, as you can lose access to very useful methods from the Object class or superclasses. 

# class Parent 
#   def say_hi
#     p "Hi from Parent."
#   end 
# end 

# class Child
#   def say_hi 
#     p "Hi from Child."
#   end

#   def send 
#     p "send from Child..."
#   end

#   def instance_of?
#     p "I am a fake instance"
#   end 
# end 

# c = Child.new 
# p c.instance_of? Child 
# p c.instance_of? Parent 

# heir = Child.new
# heir.instance_of? Child
