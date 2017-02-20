class TicTacToe

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
def initialize
@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def won?
end_value = false
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|position| @board[position] == "X"} || combo.all?{|position| @board[position] == "O"}
    end_value = combo

  end
end
return end_value
end

def full?
  return !(@board.include?(" "))
end

def draw?
return !won? && full?
end

def over?
  return draw? || won?
end

def winner
  if won? == false
    return nil
  else return @board[won?[0]]
  end
end


def turn_count
counter = 0
  @board.each do |value|
    if value != " " && value != "" && value != nil
      counter += 1
    end
  end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

def valid_move?(index)
index = input_to_index(index)
if index.between?(0,9) && position_taken?(index) == false
  return true
end
end

def position_taken?(index)
if @board[index] == " " || @board[index] == "" || @board[index] == nil
  return false
elsif @board[index] == "X" || "O"
  return true
end
end

def input_to_index(input)
  input.to_i - 1
end

def move(choice, token = "X")

  @board[input_to_index(choice)] = token

end

def turn
token = current_player
puts "Please enter a number 1-9:"
choice = gets
if valid_move?(choice)
  move(choice, token)
  display_board
else
  puts "Sorry, invalid"
  turn
end
end

def play
until over?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  else puts "Cats Game!"
  end
end


end
