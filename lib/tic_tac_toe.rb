class TicTacToe


def initialize
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Last row
  [0,3,6], # Left coloumn
  [1,4,7], # Middle coloumn
  [2,5,8], # Right coloumn
  [0,4,8], # Left to right diagonal
  [2,4,6] # Right to left diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, character)
  @board[index] = character
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end

#def position_taken?(board, location)
#  board[location] != " " && board[location] != ""
#end

def valid_move?(index)
  if (index.between?(0,8) == true) && (position_taken?(index) == false)
    true
  else
    false
  end
end

#def valid_move?(board, index)
#  index.between?(0,8) && !position_taken?(board, index)
#end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    player_character = current_player
    move(index, player_character)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0

  @board.each do |position|
    if position == "X" || position == "O"
    counter += 1
  end
end
counter

end

def current_player
  turn = turn_count
  if turn % 2 == 0
    "X"
  else
    "O"
  end
end

#def current_player(board)
#turn = turn_count(board)
#your_turn = turn % 2 == 0 ? "X" : "O"
#  end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    end
  end
  return false
end

def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if draw? || won?
    return true
  else
    return false
  end
end

def winner
  win_position = won?
  if win_position == false
    return nil
  else
    if @board[win_position[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
