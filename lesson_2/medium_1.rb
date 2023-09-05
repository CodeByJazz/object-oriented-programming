=begin
Question 1: 
Modify this class so both flip_switch and the setter method switch= are private methods.

# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def view
#     switch 
#   end

#   private

#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# r2d2 = Machine.new
# r2d2.start
# p r2d2.inspect

# puts r2d2.view
=end

=begin 
Question 2: 
A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

class FixedArray
  attr_reader :arr

  def initialize(num_of_elements)
    @arr = [nil] * num_of_elements
  end

  def []=(idx, obj)
    self[idx]
    arr[idx] = obj
  end

  def [](idx)
    arr.fetch(idx)
  end

  def to_a 
    arr
  end

  def to_s 
    "#{arr}"
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
=end

=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end  
=end

=begin   
Question 3: 

Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

enqueue to add an object to the queue
dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

class CircularQueue
  attr_reader :queue, :buffer_size

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @queue = Array.new
  end

  def enqueue(num)
    if queue.size < buffer_size
      queue << num 
    else  
      dequeue
      queue << num
    end
  end

  def dequeue
    queue.shift
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

=end

=begin
Question 4:    
=end

=begin  
Question 5: 

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

Question 6: 
In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. 

class GuessingGame
  def initialize(low_value, high_value)
    @low_value = low_value
    @high_value = high_value
    @winning_number = nil
    @current_guess = nil
    @guess_count = Math.log2((low_value..high_value).size).to_i + 1
  end
  
  def display_guesses_remaining
    puts ""
    puts "You have #{guess_count} guesses remaining."
  end

  def player_choose
    guess = nil
    loop do
      puts "Enter a number between #{low_value} and #{high_value}: "
      guess = gets.chomp.to_i 
      break if (low_value..high_value).to_a.include?(guess)
      puts "Invalid guess. Enter a number between 1 and 100: "
    end
    self.guess_count -= 1
    self.current_guess = guess
  end

  def display_guess_results
    return if (winning_number - current_guess) == 1 
    puts "Your guess is too low." if (current_guess < winning_number)  
    puts "Your guess is too high." if (current_guess > winning_number)
    puts "That's the number!" if (current_guess == winning_number) 
  end 

  def end_game?
    current_guess == winning_number || guess_count == 0
  end 

  def display_game_results
    puts ""
    if current_guess == winning_number
      puts "You won!"
    else 
      puts "You have no more guesses. You lost!"
    end
  end 

  def reset_game
    self.guess_count = Math.log2((low_value..high_value).size).to_i + 1
    self.winning_number = rand(low_value..high_value)
  end

  def play 
    reset_game
    loop do 
      display_guesses_remaining 
      player_choose
      display_guess_results 
      break if end_game? 
    end
    display_game_results
  end

  private
  
  attr_accessor :guess_count, :current_guess, :winning_number
  attr_reader :low_value, :high_value
end

game = GuessingGame.new(501, 1500)
game.play
game.play
=end 

=begin   
Question 7: 

Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:

For this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens, and Aces are higher than Kings. The suit plays no part in the relative ranking of cards.

If you have two or more cards of the same rank in your list, your min and max methods should return one of the matching cards; it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards, create a #to_s method that returns a String representation of the card, e.g., "Jack of Diamonds", "4 of Clubs", etc.

class Card
  include Comparable 

  attr_reader :rank, :suit

  VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value 
    p VALUES.fetch(rank, rank)
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end


cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
p cards.min #== Card.new(2, 'Hearts')
# puts cards.max# == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8
=end

=begin    
Question 8:
Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

Question 9: 
In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand. If you've never played poker before, you may find this overview of poker hands useful.

# =end
# class Card
#   include Comparable 

#   attr_reader :rank, :suit

#   VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def value 
#     p VALUES.fetch(rank, rank)
#     VALUES.fetch(rank, rank)
#   end

#   def <=>(other_card)
#     value <=> other_card.value
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end
# end

# class Deck
#   attr_reader :deck

#   RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   def initialize
#     @deck = []
#     create_deck
#   end

#   def create_deck 
#     RANKS.shuffle.each do |rank|
#       SUITS.shuffle.each do |suit|
#         deck << Card.new(rank, suit)
#       end 
#     end
#   end

#   def size 
#     deck.size 
#   end

#   def deal_cards
#     <<
#   end

#   def draw 
#     create_deck if deck.empty?
#     deck.pop
#   end
# end

# class PokerHand < Deck
#   def initialize(cards)
#     @cards = []
#     @rank_count = Hash.new(0)

#     5.times do 
#       card = cards.draw
#       @cards << card
#       @rank_count[card.rank] += 1
#     end
#   end

#   def print
#     puts @cards
#   end

#   def evaluate
#     case
#     when royal_flush?     then 'Royal flush'
#     when straight_flush?  then 'Straight flush'
#     when four_of_a_kind?  then 'Four of a kind'
#     when full_house?      then 'Full house'
#     when flush?           then 'Flush'
#     when straight?        then 'Straight'
#     when three_of_a_kind? then 'Three of a kind'
#     when two_pair?        then 'Two pair'
#     when pair?            then 'Pair'
#     else                       'High card'
#     end
#   end

#   private

#   def royal_flush?
#     straight_flush? && @cards.min.rank == 10
#   end

#   def straight_flush?
#     flush? && straight?
#   end

#   def four_of_a_kind?
#     n_of_a_kind?(4)
#   end

#   def full_house?
#     n_of_a_kind?(3) && n_of_a_kind?(2)
#   end

#   def flush?
#     suit = @cards.first.suit
#     @cards.all? {|card| card.suit == suit}
#   end

#   def straight?
#     return false if @rank_count.any? {|_, count| count > 1}
#     @cards.min.value  == @cards.max.value - 4
#   end

#   def n_of_a_kind?(number)
#     @rank_count.one? { |_, count| count == number }
#   end

#   def three_of_a_kind?
#     n_of_a_kind?(3)
#   end

#   def two_pair?
#     @rank_count.select {|_, count| count == 2}.size == 2
#   end

#   def pair?
#     n_of_a_kind?(2)
#   end
# end

# hand = PokerHand.new(Deck.new)
# p hand.cards
# hand.print
# puts hand.evaluate

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'

Customer 
-Choose Option
-
Order
Meal Item
Burger 
Side
Drink 
=end