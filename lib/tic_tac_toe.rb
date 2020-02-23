#initialize and assign an instance variable @board to an array with 9 blank spaces
class TicTacToe
  attr_accessor :board

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

#defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

#prints arbitrary arrangements of the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #accepts the user's input (a string) as an argument
  def input_to_index(input)
  #converts the user's input (a string) into an integer
  #converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)
    input.to_i - 1
  end
  #allows "X" player in the top left and "O" in the middle
  def move(position, token='X')
    @board[position] = token
  end

  #returns true/false based on whether the position on the board is already occupied
  def position_taken?(input)
    @board[input] == "X" || @board[input] == "O"
  end

  #returns true/false based on whether the position is already occupied
  def valid_move?(input)
  #checks that the attempted move is within the bounds of the game board
    input.between?(0, 8) && !position_taken?(input)
  end

  #counts occupied positions
  def turn_count
    taken = 0
    @board.each do |i|
      if i == "X" || i == "O"
        taken += 1
      end
    end
    return taken
  end

  #returns the correct player, X, for the third move
  #returns the correct player, O, for the fourth move
  def current_player
    player = nil
    if turn_count() % 2 == 0
      player = 'X'
    else
      player = 'O'
    end
    return player
  end

  #receives user input via the gets method
  def turn
    puts "Choose a spot between 1-9"
    spot = gets.strip
    #calls #input_to_index, #valid_move?, and #current_player
    #makes valid moves and displays the board
    #loop back spot/input if/else statement to ask for input again after a failed validation
    spot = input_to_index(spot)
    if valid_move?(spot)
      move(spot, current_player)
    else
      turn
    end
    display_board
  end

  #returns false for a draw
  #returns the winning combo for a win
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  #returns true for a draw
  #returns false for an in-progress game
  def full?
    turn_count == 9
  end

  #returns true for a draw
  #returns false for a won game
  #returns false for an in-progress game
  def draw?
    !won? && full?
  end

  #returns true for a draw
  #returns true for a won game
  #returns false for an in-progress game
  def over?
    won? || full? || draw?
  end

  #return X when X won
  #returns O when O won
  #returns nil when no winner
  def winner
    won = ""
    if winner = won?
      won = @board[winner.first]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
