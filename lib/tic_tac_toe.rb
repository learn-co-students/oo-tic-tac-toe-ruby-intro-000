require 'pry'

class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

<<<<<<< HEAD
=======
#
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, character = "X")
@board[index] = character
end

def position_taken?(index)
  if @board[index] ==  " "
    return false
  else @board[index] ==  "X" || "O"
    return true
  end
end

def valid_move?
!position_taken? && (0,8)
end
end

# def turn
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
# if valid_move?
#   character = current_player
#   move
#   display_board
# else
#   turn
# end
# end

#
# def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end
#
# def current_player(board)
#   if turn_count(board).even?
#   "X"
# else
#   "O"
#   end
# end
#

#
# def won?(board)
#   WIN_COMBINATIONS.each do |combinations|
#     if board[combinations[0]] == board[combinations[1]] && board[combinations[1]] == board[combinations[2]] && position_taken?(board, combinations[0])
#   return combinations
#   end
#  end
#  return false
# end
#
# def full?(board)
#     board.all? do |space|
#     space == "X" || space == "O"
#     # if board[space[0]] == board[space[1]] && board[space[1]] == board[space[2]] && position_taken?(board, space[0])
#   end
# end
#
# def draw?(board)
#   full?(board) && !won?(board)
# end
#
# def over?(board)
#   full?(board) || won?(board) || draw?(board)
# end
#
# def winner(board)
#   win = won?(board)
#   if win!=false
#     return board[win[0]]
#   end
# end
>>>>>>> 51ea14d9670ca9666b32dc1e301b8c9deeeffa48
#
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, character = "X")
@board[index] = character
end

def position_taken?(index)
  if @board[index] ==  " "
    return false
  else @board[index] ==  "X" || "O"
    return true
  end
end

def valid_move?(index)
!position_taken?(index) && index.between?(0,8)
end

def turn_count
@board.count{|token| token == "X" || token == "O"}
end

def current_player
turn_count % 2 == 0? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(index)
  character = current_player
  move(index, character)
  display_board
else
  turn
end
end

def won?
  WIN_COMBINATIONS.each do |combinations|
    if @board[combinations[0]] == @board[combinations[1]] && @board[combinations[1]] == @board[combinations[2]] && position_taken?(combinations[0])
  return combinations
  end
 end
 return false
end

def full?
    @board.all? do |space|
    space == "X" || space == "O"
    end
  end

def draw?
  full? && !won?
end

def over?
  full? || won? || draw?
end

def winner
  win = won?
    if win
      @board[win[0]]
    end
  end

def play
turn until over?
if won?
  puts "Congratulations #{winner}!"
else
  puts "Cat's Game!"
end
end
end
