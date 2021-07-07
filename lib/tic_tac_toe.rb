class TicTacToe

def initialize(board=nil)
@board = board || Array.new(9," ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #Left diagonal
  [2, 4, 6] #Right diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
@board[index] != " " && @board[index] != ""
end
def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end

def turn_count
  turn = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player
  turn_count % 2 == 0? "X":"O"
end

def turn
  puts "Please enter a number between 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    if (@board[win_combination[0]]) == "X" && (@board[win_combination[1]]) == "X" && (@board[win_combination[2]]) == "X"
      return win_combination
    elsif (@board[win_combination[0]]) == "O" && (@board[win_combination[1]]) == "O" && (@board[win_combination[2]]) == "O"
      return win_combination
    end
    false
end
end

def full?
  @board.all? do |index| index == "X" || index == "O"
  end
end

def draw?
  !won? && full?
end

def over?
won? || draw? || full?
end

def winner
  if win_combination = won?
    @board[win_combination.first]
  end
end

def play
until over?
  current_player
  turn
end
if won?
  puts "Congratulations #{winner}!"
else
  puts "Cat's Game!"
end
end
end
