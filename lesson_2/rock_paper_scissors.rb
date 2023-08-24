class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
    (paper? && other_move.rock?) ||
    (scissors? && other_move.paper?) ||
    (rock? && other_move.lizard?) ||
    (lizard? && other_move.spock?) ||
    (spock? && other_move.scissors?) ||
    (scissors? && other_move.lizard?) ||
    (lizard? && other_move.paper?) ||
    (paper? && other_move.spock?) ||
    (spock? && other_move.rock?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
    (paper? && other_move.scissors?) ||
    (scissors? && other_move.rock?) ||
    (lizard? && other_move.rock?) ||
    (spock? && other_move.lizard?) ||
    (scissors? && other_move.spock?) ||
    (lizard? && other_move.scissors?) ||
    (paper? && other_move.lizard?) ||
    (spock? && other_move.paper?) ||
    (rock? && other_move.spock?)

  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name
  attr_reader :score, :moves

  def initialize
    @score = 0
    @moves = []
    set_name
  end

  def add_point
    @score += 1
  end

  def reset_score 
    @score = 0 
  end

  def add_move
    @moves << move
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
      puts ""
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do 
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
      puts ""
    end
    self.move = Move.new(choice)
    self.add_move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.add_move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

 
  def display_moves
    puts ""
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won this round!"
      puts ""
      human.add_point
    elsif human.move < computer.move
      puts "#{computer.name} won this round!"
      puts ""
      computer.add_point
    else
      puts "It's a tie for this round!"
      puts ""
    end
  end 

  def display_game_winner
    if human.score > computer.score
      puts "#{human.name} won the game!"
      puts ""
    elsif human.score < computer.score
      puts "#{computer.name} won the game!"
      puts ""
    elsif human.score == computer.score
      puts "It's a tie!"
      puts ""
    end
  end

  def display_player_moves
    puts "#{human.name}'s moves: #{human.moves.collect(&:value)}"
    puts "#{computer.name}'s moves: #{computer.moves.collect(&:value)}"
  end

  def reset_game
    system 'clear'
    human.reset_score
    computer.reset_score
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
      puts ""
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do 
      reset_game
      loop do
        human.choose
        computer.choose
        display_moves
        display_round_winner
        break if human.score == 3 || computer.score == 3
      end
      display_game_winner
      break unless play_again?
    end
    display_goodbye_message
    display_player_moves
  end
end

RPSGame.new.play
