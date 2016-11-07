# Rock, Paper, Scissors is a two-player game where each player chooses one of
# three possible moves: rock, paper, or scissors. The chosen moves will then
# be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  WINNERS = { "rock" => %w(scissors lizard), "paper" => %w(rock spock),
              "scissors" => %w(paper lizard), "lizard" => %w(spock paper),
              "spock" => %w(scissors rock) }.freeze

  def initialize(value)
    @value = value
  end

  def winning_choice?(other_choice)
    WINNERS[@value].include?(other_choice)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry invalid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5', 'Ziggy'].sample
  end

  def choose
    computer_choice = Move::VALUES.sample
    self.move = Move.new(computer_choice)
  end
end
# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hello #{human.name}!"
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first to score ten points wins the game."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_score
    puts "#{human.name}'s current score is #{human.score}"
    puts "#{computer.name}'s current score is #{computer.score}"
  end

  def determine_winner
    if human.move.winning_choice?(computer.move.value)
      "Human"
    elsif computer.move.winning_choice?(human.move.value)
      "Computer"
    end
  end

  def change_score
    if winner == "Human"
      human.score += 1
    elsif winner == "Computer"
      computer.score += 1
    end
  end

  def display_winner
    self.winner = determine_winner
    if !winner.nil?
      if winner == "Human"
        puts "#{human.name} won!"
      else
        puts "#{computer.name} won!"
      end
      change_score
    else
      puts "It's a tie!"
    end
  end

  def big_game_winner?
    (human.score == 10) || (computer.score == 10)
  end

  def display_bgame_winner
    if human.score == 10
      puts "#{human.name} won the whole enchilada!"
    else
      puts "#{computer.name} won the whole enchilada! Better luck next time."
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry must be y or n."
    end

    human.score = 0 && computer.score = 0 if answer == 'y'
    return false if answer == 'n'
    return true if answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      determine_winner
      display_winner
      display_score
      if big_game_winner?
        display_bgame_winner
        break unless play_again?
      end
    end

    display_goodbye_message
  end
end

RPSGame.new.play
