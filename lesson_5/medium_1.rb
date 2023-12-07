# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def view_state
#     switch
#   end

#   private 

#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# class FixedArray 
#   def initialize(num)
#     @array = Array.new(num)
#   end

#   def [](index)
#     @array.fetch(index)
#   end

#   def []=(idx, obj)
#     @array.fetch(idx)
#     @array[idx] = obj
#   end

#   def to_a 
#     @array
#   end

#   def to_s 
#     @array.to_s
#   end
# end
# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end


# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student; end

# class CircularQueue
#   attr_reader :queue, :buffer_size

#   def initialize(buffer_size)
#     @buffer_size = buffer_size
#     @queue = Array.new 
#   end

#   def enqueue(num)
#     if queue.size < buffer_size
#       queue << num 
#     else 
#       dequeue
#       queue << num 
#     end
#   end

#   def dequeue
#     queue.shift
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# class MinilangError < StandardError; end
# class BadTokenError < MinilangError; end
# class EmptyStackError < MinilangError; end

# class Minilang
#   ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

#   attr_accessor :register 
#   attr_reader :commands, :stack

#   def initialize(commands)
#     @register = 0
#     @stack = []
#     @commands = commands.split
#   end

#   def eval 
#     commands.each do |command|
#       if ACTIONS.include?(command)
#         case command 
#         when 'PRINT' then puts register 
#         when 'PUSH'  then stack << register
#         when 'ADD'   then self.register = (register + stack.pop) 
#         when 'SUB'   then self.register = (register - stack.pop)
#         when 'MULT'  then self.register = (register * stack.pop)
#         when 'DIV'   then self.register = (register / stack.pop)
#         when 'MOD'   then self.register = (register % stack.pop)
#         when 'POP'   then self.register = (stack.pop) 
#         end
#       elsif command =~ /\A[-+]?\d+\z/
#         self.register = command.to_i
#       else 
#         raise BadTokenError, "Invalid token :#{command}"
#       end 
#     end
#   end
# end

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# # Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval


# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# class GuessingGame 
#   attr_accessor :guess_count, :player_choice, :winning_number

#   def initialize(low_num, high_num)
#     @range = low_num..high_num
#     @guess_count = Math.log2(@range.size).to_i + 1
#     @winning_number = rand(@range)
#     @player_choice = nil
#   end

#   def display_guess_count
#     puts ""
#     puts "You have #{guess_count} guesses remaining."
#   end

#   def player_choose
#     choice = nil
#     loop do 
#       puts "Enter a number between #{@range.first} and #{@range.last}: "
#       choice = gets.chomp.to_i
#       break if @range.cover?(choice)
#       puts "Invalid guess. Enter a number between #{@range.first} and #{@range.last}:"
#     end
#     self.guess_count -= 1
#     self.player_choice = choice
#   end

#   def display_hint
#     if (player_choice + 1) == winning_number || (player_choice - 1) == winning_number
#     elsif player_choice < winning_number
#       puts "Your guess is too low."
#     elsif player_choice > winning_number
#       puts "Your guess is too high."
#     else
#       puts "That's the number!"
#     end
#   end

#   def game_over?
#     guess_count == 0 || player_choice == winning_number
#   end

#   def display_game_results
#     if guess_count == 0 
#       puts ""
#       puts "You have no more guesses. You lost!"
#     else 
#       puts ""
#       puts "You won!"
#     end
#   end

#   def reset_game 
#     self.winning_number = rand(@range)
#     self.guess_count = Math.log2(@range.size).to_i + 1 
#   end

#   def play 
#     reset_game
#     loop do 
#       display_guess_count
#       player_choose
#       display_hint
#       break if game_over?
#     end
#     display_game_results
#   end
# end

# game = GuessingGame.new(501, 1500)
# game.play

# # You have 10 guesses remaining.
# # Enter a number between 501 and 1500: 104
# # Invalid guess. Enter a number between 501 and 1500: 1000
# # Your guess is too low.

# # You have 9 guesses remaining.
# # Enter a number between 501 and 1500: 1250
# # Your guess is too low.

# # You have 8 guesses remaining.
# # Enter a number between 501 and 1500: 1375
# # Your guess is too high.

# # You have 7 guesses remaining.
# # Enter a number between 501 and 1500: 80
# # Invalid guess. Enter a number between 501 and 1500: 1312
# # Your guess is too low.

# # You have 6 guesses remaining.
# # Enter a number between 501 and 1500: 1343
# # Your guess is too low.

# # You have 5 guesses remaining.
# # Enter a number between 501 and 1500: 1359
# # Your guess is too high.

# # You have 4 guesses remaining.
# # Enter a number between 501 and 1500: 1351
# # Your guess is too low.

# # You have 3 guesses remaining.
# # Enter a number between 501 and 1500: 1355
# # That's the number!

# # You won!

# game.play
# # You have 10 guesses remaining.
# # Enter a number between 501 and 1500: 1000
# # Your guess is too high.

# # You have 9 guesses remaining.
# # Enter a number between 501 and 1500: 750
# # Your guess is too low.

# # You have 8 guesses remaining.
# # Enter a number between 501 and 1500: 875
# # Your guess is too high.

# # You have 7 guesses remaining.
# # Enter a number between 501 and 1500: 812
# # Your guess is too low.

# # You have 6 guesses remaining.
# # Enter a number between 501 and 1500: 843
# # Your guess is too high.

# # You have 5 guesses remaining.
# # Enter a number between 501 and 1500: 820
# # Your guess is too low.

# # You have 4 guesses remaining.
# # Enter a number between 501 and 1500: 830
# # Your guess is too low.

# # You have 3 guesses remaining.
# # Enter a number between 501 and 1500: 835
# # Your guess is too low.

# # You have 2 guesses remaining.
# # Enter a number between 501 and 1500: 836
# # Your guess is too low.

# # You have 1 guess remaining.
# # Enter a number between 501 and 1500: 837
# # Your guess is too low.

# # You have no more guesses. You lost!

# class Card
#   include Comparable

#   attr_accessor :new_rank
#   attr_reader :suit, :rank

#   def initialize(rank, suit)
#     @rank = rank
#     @new_rank = nil
#     @suit = suit
#     true_rank
#   end

#   def true_rank 
#     case rank
#     when "Jack" then self.new_rank = 11
#     when "Queen" then self.new_rank = 12
#     when "King" then self.new_rank = 13
#     when "Ace" then self.new_rank = 14
#     else 
#       self.new_rank = rank
#     end
#   end

#   def <=>(other_card)
#     new_rank <=> other_card.new_rank
#   end

#   def to_s 
#     "#{rank} of #{suit}"
#   end
# end

# cards = [Card.new(2, 'Hearts'),
#   Card.new(10, 'Diamonds'),
#   Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#   Card.new(4, 'Diamonds'),
#   Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#   Card.new('Jack', 'Diamonds'),
#   Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#   Card.new(8, 'Clubs'),
#   Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# class Card
#   include Comparable

#   attr_reader :suit, :rank

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s 
#     "#{rank} of #{suit}"
#   end
# end


# class Card
#   include Comparable

#   attr_accessor :new_rank
#   attr_reader :suit, :rank

#   def initialize(rank, suit)
#     @rank = rank
#     @new_rank = nil
#     @suit = suit
#     true_rank
#   end

#   def true_rank 
#     case rank
#     when "Jack" then self.new_rank = 11
#     when "Queen" then self.new_rank = 12
#     when "King" then self.new_rank = 13
#     when "Ace" then self.new_rank = 14
#     else 
#       self.new_rank = rank
#     end
#   end

#   def to_s 
#     "#{rank} of #{suit}"
#   end
# end

# class Deck
#   RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   attr_accessor :cards

#   def initialize
#     @cards = []
#     shuffle_deck
#   end

#   def shuffle_deck
#     SUITS.each do |suit|
#       RANKS.each do |rank|
#         cards << Card.new(rank, suit)
#       end 
#     end 
#     cards.shuffle!
#   end

#   def display_cards 
#     p cards
#   end

#   def draw 
#     if cards.empty?
#       shuffle_deck 
#     else
#       cards.pop
#     end
#   end
# end

# class PokerHand
#   def initialize(deck)
#     @ranks = []
#     @new_ranks = []
#     @poker_hand = deck
#     deal_cards if deck.class == Deck
#     get_ranks
#   end

#   def deal_cards
#     cards = []
#     5.times {cards << poker_hand.draw}
#     self.poker_hand = cards
#   end

#   def print
#     puts poker_hand
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

#   attr_reader :ranks, :new_ranks
#   attr_accessor :poker_hand

#   def same_suit? 
#     poker_hand.all? do |card|
#       poker_hand[0].suit == card.suit 
#     end
#   end

#   def get_ranks
#     poker_hand.each do |card|
#       new_ranks << card.new_rank.to_s
#     end

#     poker_hand.each do |card|
#       ranks << card.rank.to_s
#     end
#   end

#   def sequence? 
#     values = new_ranks.map {|rank| rank.to_i}.sort
#     booleans = []

#     values.each_with_index do |value, idx|
#       booleans << ((value + 1) == values[idx + 1]) unless value == values.last
#     end

#     booleans.all? {|boolean| boolean == true}
#   end

#   def royal_flush?
#     same_suit? && ['10', 'Ace', 'Jack', 'King', 'Queen'] == ranks.sort
#   end

#   def straight_flush?
#     same_suit? && sequence?
#   end

#   def four_of_a_kind?
#     ranks.any? do |rank|
#       ranks.count(rank) == 4
#     end
#   end

#   def full_house?
#     count = []
#     count << new_ranks.count(new_ranks[0])
#     count << new_ranks.count(new_ranks[-1])
#     count.include?(3) && count.include?(2)
#   end

#   def flush?
#     same_suit? && !sequence?
#   end

#   def straight?
#     !same_suit? && sequence?
#   end

#   def three_of_a_kind?
#     ranks.any? do |rank|
#       ranks.count(rank) == 3
#     end
#   end

#   def two_pair?
#     pairs = ranks.map do |rank|
#       ranks.count(rank)
#     end

#     pairs.count(2) == 4
#   end

#   def pair?
#     pairs = ranks.map do |rank|
#       ranks.count(rank)
#     end

#     pairs.count(2) == 2
#   end
# end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# # # Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# hand.print
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
