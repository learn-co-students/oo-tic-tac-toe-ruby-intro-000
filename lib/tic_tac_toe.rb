class TicTacToe
  
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
[2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (user_input)
  user_input.to_i - 1
end

def move(index, player)
  @board[index] = player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if (index < 0 || index > 8)
    false
  elsif (position_taken?(index))
    false
  else
    true
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if (valid_move?(index))
    move(index, current_player)
    display_board
  else
    puts "Invalid move. Please try again!"
    user_input = gets.strip
  end
end

def turn_count
  counter = 0
  @board.each do |turns|
    if (turns == "X" || turns == "O")
    counter += 1
    end
  end
  return counter
end

def current_player
  counter = turn_count
  if counter.even?
    player = "X"
  else
    player = "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_array|
  @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[0])
  end
end

def full?
  @board.all?{|position| position == "X" || position == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if win_combination = won?
  @board[win_combination.first]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
