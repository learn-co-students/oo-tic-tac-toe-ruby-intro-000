class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    display_board
  end

#display board
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#check if position is taken
def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

#convert input to integer index method
def input_to_index(index)
  return index.to_i - 1
end

#move method
def move(index, player)
  return @board[index] = player
end

#check if the user's move is already taken and if it falls on the board
def valid_move?(index)
  !position_taken?(index) && (index).between?(0,8)
end

#grab the user's turn input
def turn
  puts "Please enter 1-9:"
  #gets user input=
  input = gets.strip
  index = input_to_index(input)

  player = current_player
    #actions for valid move
    if valid_move?(index)
      move(index, player)
    else
      #action for invalid move
      turn
    end
    display_board
end

#play method
def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end


#turn count method
def turn_count
    @board.count{|token| token == "X" || token == "O"}
end


#determine current_player
def current_player
  turn_count.even? ? "X" : "O"
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

#determine if a winning combination is currently represented by one player on the board
def won?
	WIN_COMBINATIONS.each do |combo_array|
  		if @board[combo_array[0]] == @board[combo_array[1]] && @board[combo_array[2]] == @board[combo_array[0]] && @board[combo_array[2]] != " "
          	return combo_array
    		end
	end
  #return false for no wins
	return false
end

#check if all spots on the board are filled with a player character
def full?
  full_board = @board.all? do |value|
    value == "X" || value == "O"
  end
  full_board
end

#determine if the full board is a draw or a win
def draw?
  !won? && full?
end

#determine if the game is over.  a win, draw, and full board return true
def over?
  won? || draw? || full?
end

#determine who the winner is
def winner
  #grab the result of the won? method (should be true or false)
  if won?
    #if there is a win, grab the returned winning combination array
    winning_combination = won?
    #check the first index in the winning combination against the matching board array index
            @board[winning_combination[0]]
      else
        nil
  end
end
end
