class TicTacToe

  def initialize(board=@board)
    @board = Array.new(9, " ")
  end


WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

def display_board
  p " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  p "-----------"
  p " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  p "-----------"
  p " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
index = user_input.to_i - 1
end


def move(index,token="X")
@board[index] = token
end


def position_taken?(index)
if @board[index] =="X" or @board[index] == "O"
  return true
else
  @board[index] = " "
  return false
end

end

def valid_move?(index)
    if position_taken?(index) == true
      return false
    elsif index > 8 or index < 0
      return false
    end
    return true
end


def turn_count
  @board.count{|i| i == "X" or i == "O"}
end

def current_player
  if turn_count%2==0
    return "X"
  else
    turn_count%2==1
    return "O"
  end

end


def turn
  p "Please enter a number (1-9):"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index,token)
    display_board
  else
    turn
  end
end


def won?
WIN_COMBINATIONS.each do |i|
  if (@board[i[0]] == "X" and @board[i[1]] =="X" and @board[i[2]] == "X")
    # || (@board[i[0]] == "O" and @board[i[1]] == "O" and @board[i[2]] == "O")
    return i
  elsif (@board[i[0]] == "O" and @board[i[1]] =="O" and @board[i[2]] == "O")
    return i
end
end
return false


end





def full?

  if turn_count == 9
    return true
  else
    return false
  end
end


def draw?

  if turn_count == 9 and !won?
    return true
  elsif won?
    return false
  elsif !full? and !won?
    false
  end

end


def over?
  if won? or full? or draw?
    true
  else
    false
  end
end

def winner


if won?
  if @board[won?[0]] == "X"
    return "X"
  else
    return "O"
  end
end

if !won?
return nil
end


end


def play
  until over?
    turn
  end


if draw?
  puts "Cat's Game!"
elsif won?
  puts "Congratulations #{winner}!"
end

end


end
