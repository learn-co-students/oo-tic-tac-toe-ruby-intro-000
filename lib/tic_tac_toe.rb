class TicTacToe

 def initialize(board = nil)
  @board = board || Array.new(9, " ")
 end

WIN_COMBINATIONS = [
 [0,1,2], # top row
 [3,4,5], # middle row
 [6,7,8], # bottom row
 [0,4,8], # left diagonal
 [2,4,6], # right diagonal
 [0,3,6], # vertical left
 [1,4,7], # vertical middle
 [2,5,8] # vertical right
]

def display_board(board = @board)
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(input)
 unless input =~ /\d/
   return index = -1
 end
  input = input.to_i
  until input.between?(1,9)
    turn(board)
    input = input.to_i
  end
    return index = input - 1
end

def move(index = @index, token = @token || @token="X")
 @board[index] = token
end

def position_taken?(index = @index)
 !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index = @index)
 if position_taken?(index) == false && index.between?(0,8) == true
    return true
 elsif index.between?(0,8) == false
    return false
 end
end

def turn_count(board = @board)
  @board.count{|token| token == "X" || token == "O"}
end

def current_player(board = @board)
 turn_count % 2 == 0 ? "X" : "O"
end

#left off here...need to fix #turn
def turn(board = @board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) != true
    puts "Please enter 1-9:"
    input = gets.strip
  else
    move(index,current_player)
    display_board(board)
  end
end

def won?(board = @board)
  WIN_COMBINATIONS.each do |win_index|
    board_subarray = []
     win_index.each do |position|
       board_subarray << board[position]
     end
   if board_subarray.all?{|letters| letters == "X"} || board_subarray.all?{|letters| letters == "O"}
     return win_index
   end
  end
 return nil
end


def full?(board = @board)
 if @board.all?{|letters| letters == "X" || letters == "O"}
   return true
 else
   return false
 end
end

def draw?(board = @board)
status = won?(board)
if status == false || status == nil && full?(board) == true
  return true
elsif status == false && full?(board) != true
  return false
elsif status == true
  return false
end
end

def over?(board = @board)
  if won?(board) || draw?(board)   #game is won or it's a draw or board is full
    return true
  else # game is not won and board is not full
    return false
  end
end

def winner(board = @board)
 array_index = won?(board)
 if array_index == nil
   return nil
 end
 letters = []
 array_index.each{|index| letters << board[index] }
 if letters.all?{|letter| letter == "X"}
   return "X"
 elsif letters.all?{|letter| letter == "O"}
   return "O"
 else
   return nil
 end
end

def play(board = @board)
  until over?(board) == true
    turn(board)
  end
  game_won = won?(board)
  game_draw = draw?(board)
  if game_won != nil
    puts "Congratulations #{winner(board)}!"
    return
  end
  if game_draw != false
    puts "Cat's Game!"
    return
  end
end

end
