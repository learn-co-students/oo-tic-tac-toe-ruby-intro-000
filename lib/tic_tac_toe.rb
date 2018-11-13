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

end