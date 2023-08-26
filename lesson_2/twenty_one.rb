=begin
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
-Both participants are initially dealt 2 cards from a 52-card deck.
-The player takes the first turn and can 'hit' or 'stay'.
-If the player busts, he loses. If he stays, it's the dealer's turn.
-The dealer must hit until his cards add up to at least 17.
-If he busts, the player wins. If both player and dealer stay, then the highest total wins.
-If both totals are equal, then it's a tie, and nobody wins.

Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts

Player 
-hit
-stay
-busted?
-total

Dealer
-hit
-stay
-busted?
-total
-deal?

Participant

Deck 
-deal?

Card

Game
-start
=end

# module Hand
#   def initialize
#   end

#   def hit 
#   end

#   def stay 
#   end 

#   def busted?
#   end

#   def total 
#   end
# end

# class Player < Participant
#   include Hand
# end 

# class Dealer < Participant
#   include Hand

#   def deal 
#   end

#   def hit 
#   end
# end

# class Participant 
#   def initialize
#     @name = name 
#     @cards = cards
#   end
# end

class Card
  SUITS = ["H", "D", "C", "S"]
  FACES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  def initialize
    @suit = suit 
    @face = face 
  end
  
  def to_s
    "The #{face} of #{suit}"
  end

  def face 
    case @face
    when "J" then "Jack"
    when "Q" then "Queen"
    when "K" then "King"
    when "A" then "Ace"
    else 
      @face 
    end
  end

  def suit 
    case @suit 
    when "H" then "Hearts"
    when "D" then "Diamonds"
    when "S" then "Spades"
    when "C" then "Clubs"
    end
  end

  def ace?
    face == "Ace"
  end

  def king? 
    face == "King"
  end 

  def queen? 
    face == "Queen"
  end

  def jack? 
    face == "Jack"
  end
end 

class Deck 
  attr_reader :deck

  def initialize 
  end

  def deal
  end
end 


class Game 
  def start 
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end 

Game.new.start