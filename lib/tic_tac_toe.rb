class TicTacToe

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input, current_player = "X")
  @board[input.to_i-1] = current_player
end

def position_taken?(input)
if @board[input] == " " || @board[input] == nil || @board[input] ==""
  return false
elsif @board[input] == "X"
  return true
elsif @board[input] == "O"
  return true
else
  return false
end
end

def valid_move?(input)
  input = input.to_i - 1
  if position_taken?(input) == false && input.between?(0,8) == true
  return true
  else
  return false
  end
end

def turn
  input = gets.strip
  if valid_move?(input) != true
     puts "invalid"
     gets.strip
  else
    move(input, current_player)
    display_board
end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  if turn_count % 2 == 0
  value = "X"
  else
  value = "O"
  end
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

def play
counter = 0
  until counter == 9 || over? == true
    turn
    counter += 1
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
