class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name, :score

  def initialize(marker, name = ["C3PO", "Wall-E", "Buzz Lightyear"].sample)
    @score = 0
    @marker = marker
    @name = name
  end

  def add_point
    @score += 1
  end

  def reset_score 
    @score = 0 
  end
end

class TTTGame
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(human_marker, human_name)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = human.marker
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}! First player to 3 points wins the game."
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye, #{human.name}!"
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
    display_score
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_name 
    puts "Please enter your name: "
    name = ""
    loop do 
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter name!"
    end
    name
  end 

  def human_marker 
    puts "Pick any marker: "
    marker = ""
    loop do 
      marker = gets.chomp
      break unless marker.empty?
      puts "Invalid choice, try again!"
    end
    marker
  end

  def joinor(keys, punctuation=', ', conjunction='or')
    return "" if keys.empty?
    return keys[0] if keys.size == 1
    return "#{keys[0]} or #{keys[1]}" if keys.size == 2
    keys.join(punctuation).insert(-3, " #{conjunction}")
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_game_winner
    clear_screen_and_display_board
    if human.score == 3
      puts "#{human.name} won!"
    elsif computer.score == 3
      puts "#{computer.name} won!"
    else 
      puts "It's a tie!"
    end
    puts ""
  end

  def increment_player_score
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      human.add_point
    when computer.marker
      computer.add_point
    else
    end
  end

  def display_score 
    puts "#{human.name}: #{human.score} p | #{computer.name}: #{computer.score} p"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = human.marker
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do 
      human.reset_score 
      computer.reset_score
      loop do 
        display_board
        player_move
        increment_player_score
        break if human.score == 3 || computer.score == 3   
        reset
      end
      display_game_winner
      break unless play_again?
      reset
      display_play_again_message
    end
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
