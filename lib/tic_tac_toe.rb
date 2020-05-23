class TicTacToe
def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  "Welcome to Tic Tac Toe!"
  @board = board
end
@winner = ""
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def display_board()
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(move)
@move = move
@this_move = @move.to_i
return @this_move - 1
end

def move(index, player = "X")
@index = index
@player = player
@board[@index] = @player
end

def position_taken?(spot)
  @spot = spot
  !(@board[@spot] == " " || @board[@spot] == "" || @board[@spot] == nil)
end

def valid_move?(index)
@ind = index
if @ind < 0 || @ind > @board.length || position_taken?(@ind)
  return false
else
  return true
end
end

def turn_count
@turn = 0
@board.each do |value|
if value == "X" || value == "O"
@turn+=1
end
end
return @turn
end

def current_player
  @play = 2
  @board.each do |value|
  if value == "X" || value == "O"
  @play+=1
  end
  end
  if @play % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn (user_input = gets.strip)
"Put a number 1-9"
@user_input = user_input
@user_move = input_to_index(@user_input)
if valid_move?(@user_move)
  move(@user_move, current_player)
  display_board
else
  puts "Invalid move"
  turn
end
end

def won?
WIN_COMBINATIONS.detect do |combo|
@win_spot_one = combo[0]
@win_spot_two = combo[1]
@win_spot_three = combo[2]

@position_one = @board[@win_spot_one]
@position_two = @board[@win_spot_two]
@position_three = @board[@win_spot_three]

if @position_one == "X" && @position_two == "X" && @position_three == "X"
  @winner = "X"
  return @win_spot_one, @win_spot_two, @win_spot_three
elsif @position_one == "O" && @position_two == "O" && @position_three == "O"
    @winner = "O"
  return @win_spot_one, @win_spot_two, @win_spot_three
end
end
end

def full?
   @board.all? do |value|
   value == "X" || value == "O"
 end
 end

def draw?
if won?
  return false
elsif !@board.all? do |value|
value == "X" || value == "O"
end
 return false
else
  return true
end
end

def over?
if draw?
  return true
elsif won?
  return true
else
  return false
end
end

def winner
  if won?
    return @winner
  else
    return nil
  end
end

 def play
   until over?
     turn(@user_play = gets.strip)
   end
   if won?
     puts "Congratulations #{@winner}!"
   elsif draw?
     puts "Cat's Game!"
 end
 end
end
