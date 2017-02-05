class TicTacToe
  def initialize
    @board = Array.new(9){" "}
  end

  WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], 
      [6, 7, 8], [0, 3, 6], 
      [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return (input.to_i - 1)
  end

  def move(index, token="X")
    @board[index] = token
  end

def position_taken?(location)
    @board[location] != " " && @board[location] != ""
end

def valid_move?(idx)
  idx.between?(0,8) && !position_taken?(idx)
  end

def turn
puts "Pick a position 1-9"
input = gets.strip
idx = input_to_index(input)
token = current_player
if valid_move?(idx)
  move(idx, token)
  display_board
else
  turn
end
end

def turn_count
  ctr = 0
  @board.each{|position|
  if position == "X" || position == "O"
    ctr += 1
  end
  }
  return ctr
end

def current_player
  if turn_count.even?
    return "X"
  elsif turn_count.odd?
    return "O"
  else
    return nil
  end
end

def won?
  win_combination = []
WIN_COMBINATIONS.each {|array|
  win_index_1 = array[0]
  win_index_2 = array[1]
  win_index_3 = array[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    win_combination << win_index_1
    win_combination << win_index_2
    win_combination << win_index_3

  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    win_combination << win_index_1
    win_combination << win_index_2
    win_combination << win_index_3
  end
}
if win_combination != []
  return win_combination
else
  return false
end
end

def full?
  if @board.all?{|i| i == "X" || i == "O"}
    return true
  else
    return false
  end
end

def draw?
if full? && !(won?)
  return true
elsif won?
  return false
else
  return false
end
end

def over?
    if draw? || won?
    return true
  else
    return false
  end
end

def winner
    if draw?
    return nil
  elsif
    array = won?
    if @board[array[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end

end

#defines the play method
def play
  until over?
    turn
  end

  if won?
    winning_token = winner
    puts "Congratulations #{winning_token}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end