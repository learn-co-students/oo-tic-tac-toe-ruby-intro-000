class TicTacToe
  # SETUP
  # Set up the play space
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # Establish what counts as a win
  WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # center row
  [6, 7, 8], # bottom row
  [0, 3, 6], # first column
  [1, 4, 7], # second column
  [2, 5, 8], # third column
  [0, 4, 8], # diagonal L-R
  [2, 4, 6] # diagonal R-L
  ]

  # Display the current board state
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # GAMEPLAY
  # Adjust user input off-by-1
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Check that there is nothing where the move will be made
  def position_taken?(index)
    @board[index] != " "
  end

  # Make sure the move is valid
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  # Make a move
  def move(index, token)
    @board[index] = token
  end

  # What turn number are we on?
  def turn_count
  @board.count{|square| square != " " }
  end

  # Whose turn is it
  def current_player
    turn_count.even? ? "X" : "O"
  end

  # To everything there is a season / Turn, Turn, Turn
  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  # YOU COULD BE A WINNER!
  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  # It's wafer thin!
  def full?
    @board.all?{|square| square != " " }
  end

  # It appears we've reached an impasse.
  def draw?
    full? && !won?
  end

  # Is This The End?
  def over?
    won? || draw?
  end

  # Winner Winner Chicken Dinner
  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  # The only winning move is not to.
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
