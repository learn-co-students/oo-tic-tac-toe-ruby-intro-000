class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    windex1 = combo[0]
    windex2 = combo[1]
    windex3 = combo[2]
    pose1 = @board[windex1]
    pose2 = @board[windex2]
    pose3 = @board[windex3]
    if pose1 == "X" && pose2 == "X" && pose3 == "X"
      return combo
    elsif pose1 == "O" && pose2 == "O" && pose3 == "O"
      return combo
  end
 end
end

def full?
  @board.all?{|space| space == "X" || space == "O"}
end

def draw?
  full? && !won?
end

def over?
  if draw?
    return true
  elsif !full? && won?
    return true
  elsif won? && full?
    return true
  end
end

def winner
 winners = won?
if won?
 return @board[winners[0]]
else
 nil
  end
end

def position_taken?(index)
  if @board[index] == " "
    return false
  elsif @board[index] == ""
    return false
  elsif @board[index] == nil
    return false
  else @board[index] == "X" || @board[index] == "O"
    return true
  end
end

def valid_move?(index)
  if index.between?(0, 8) && !position_taken?(index)
    return true
  end
end

def move(index, player)
  @board[index] = player
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) == true
    move(index, player = current_player)
    display_board
  else
    puts "invalid move try again"
    turn
  end
end

def current_player
  result = turn_count
  result.odd? ? "O" : "X"
end

def turn_count
counter = 0
@board.each do |turn|
    if turn == "O" || turn == "X"
      counter += 1
    end
  end
  return counter
end

def play
  until over?
    turn
  end
 if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
    end
end

end
