# OO Tic Tac Toe game logic

# Define the main Class for the game
class TicTacToe
# Init the board
	def initialize(board = nil)
		@board = board || Array.new(9, " ")
	end

# Define win combinations
WIN_COMBINATIONS = [
  [0,1,2], # Top horizontal
  [3,4,5], # Middle horizontal
  [6,7,8], # Bottom horizontal
  [0,3,6], # Left vertical
  [1,4,7], # Middle vertical
  [2,5,8], # Right vertical
  [0,4,8], # \ diagonal
  [2,4,6] # / diagonal
]

# Display the board by using it's instance variable
def display_board
  line = lambda { |x,y,z| " %s | %s | %s " % [x,y,z] }
  dashes = "-"*11
  
  puts line[ @board[0], @board[1], @board[2] ]
  puts dashes
  puts line[ @board[3], @board[4], @board[5] ]
  puts dashes
  puts line[ @board[6], @board[7], @board[8] ] 
end

# Convert user input to valid board index
def input_to_index(d)
  digit = d.to_i
  digit -= 1
  return digit
end

# Allows the player to make a move
def move(index, token = 'X')
  @board[index] = token
end

# Checks to see if the given board position is available
def position_taken?(index)
  (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil) ? false : true
end

# Checks to see if the move submitted by the user is valid
def valid_move?(index)
  if index.between?(0,8)
    if !position_taken?(index)
      true
    else
      false
    end
  end
end

# Gets the number of turns played
def turn_count
  turns = @board.count { |i| i == 'X' || i == 'O' }
  turns
end

# Determines whose turn it is to go
def current_player
  turn_count.even? ? "X" : "O"
end

# Allows the user to take a turn
def turn
  puts "Please enter 1-9:"
  input = gets
  go = input_to_index(input)
  if valid_move?(go)
    move(go, current_player)
    display_board
  else
    turn
  end
end

# Checks to see if there's a winning combination
def won?
  win_combo = nil

  count_letter = lambda do |arr, letter| 
    true if arr.count(letter) === 3
  end

  if @board.count { |x| x == " "} == 9
    false

  else

    WIN_COMBINATIONS.each do |combo|
      positions = [ @board[combo[0]], @board[combo[1]], @board[combo[2]] ]
      if count_letter[positions, "O"] 
        win_combo = combo
      elsif count_letter[positions, "X"] 
        win_combo = combo
      else
        false
      end
    end

  end
  return win_combo
end

# Determines if the board is full
def full?
   @board.all? { |x| x == "X" || x == "O" }  
end

# Checks to see if there's a draw
def draw?
  !won? && full?
end

# Determines if the game is over
def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

# Determines which player has won
def winner
  winner = nil
  pos = won? ? won? : 9 # used an int to avoid undefined method `[]' for nil:NilClass
  player = @board.values_at(pos[0], pos[1], pos[2])

  count_letter = lambda do |arr, letter| 
    true if arr.count(letter) === 3
  end

  if count_letter[player, "X"]
    winner = "X"
  elsif count_letter[player, "O"]
    winner = "O"
  end 
    
  return winner
end

# Define the main method for the game
def play
  congrats = Proc.new { |player| puts "Congratulations #{player}!" }
  tie = Proc.new { puts "Cat's Game!" }
  
  until over?
    turn
  end

  congrats.call(winner) if won?
  tie.call if draw?
end

end