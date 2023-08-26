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
  attr_accessor :cards

  def initialize 
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end 
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end 

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def total 
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10 
      else 
        total += card.face.to_i
      end
    end

    # correct for Aces 
    cards.select(&:ace?).count.times do 
      break if total <= 21
      total -= 10 
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Participant 
  include Hand

  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name 
    name = ''
    loop do 
      puts "What's your name?"
      break unless name.empty?
      puts "Sorry, must enter a name!"
    end
    self.name = name 
  end 

  def show_flop 
    show_hand
  end
end 

class Dealer < Participant
  ROBOTS = ["R2D2", "Hal", "Chappie", "Sonny", "Number 5"]

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts "#{cards.first}"
    puts " ?? "
    puts ""
  end
end

class TwentyOne 
  def start 
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end 

TwentyOne.new.start