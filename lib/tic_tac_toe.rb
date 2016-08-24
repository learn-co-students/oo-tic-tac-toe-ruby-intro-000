class TicTacToe

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def initialize
  @board = Array.new(9, " ")
end

def index(input)
index = input.to_i - 1
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
!won? && full?
end

def over?
  if won? || draw?
    true
  else
    false
  end
end

def position_taken?(index)
  if @board[index] == " "
    false
  else
    true
  end
end

def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)
  return true
  else
  return false
  end
end

def input_to_index(input)
  index = input.to_i - 1
end

def current_player
  if turn_count % 2 == 0
  value = "X"
  else
  value = "O"
  end
end

def turn
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) == false
  puts "invalid"
  input = gets.strip
  index = input_to_index(input)
  elsif valid_move?(index)
    move(index, current_player)
    display_board
  else
  end
end

def move(index, current_player)
  @board[index] = current_player
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def won?
  winner
end

def winner
     if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
    return "X"
  elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
    return "X"
  elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
    return "X"
  elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
    return "X"
  elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
    return "X"
  elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
    return "X"
  elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
    return "X"
  elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
    return "X"
  elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
        return "O"
  elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
        return "O"
  elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
        return "O"
  elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
        return "O"
  elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
        return "O"
  elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
        return "O"
  elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
        return "O"
  elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
        return "O"
  else
        nil
  end
end

def play
num_of_turns = 0
  until num_of_turns == 9 || over? == true
    turn
    num_of_turns += 1
  end
      if over? == true && won? == "X"
        puts "Congratulations X!"
      elsif
        over? == true && won? == "O"
        puts "Congratulations O!"
      elsif
        over? == true && won? != true
        puts "Cats Game!"
      else

      end
  end
end
