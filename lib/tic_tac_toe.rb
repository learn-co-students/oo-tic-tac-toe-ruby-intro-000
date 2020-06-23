class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, player = "X")
   @board[index] = player
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(index)
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  def on_board?(index)
    if index.between?(0, 8) == true
      return true
    else
      return false
    end
  end
  if (position_taken?(index)) == false && (on_board?(index) == true)
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
def turn_count
  counter = 0
  @board.each do |index|
    if (index == "X" || index == "O")
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = @board[win_index_1] # value of board at win_index_1
   position_2 = @board[win_index_2] # value of board at win_index_2
   position_3 = @board[win_index_3] # value of board at win_index_3
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?
   @board.all? {|i| i == "X" || i == "O"}
end

def draw?
   if !won? && full?
     return true
   else won?
     return false
   end
end

def over?
   if draw? || won? || full?
     return true
   end
end

def winner
  index = []
  index = won?
  if index == false
    return nil
  elsif @board[index[0]] == "X"
      return "X"
    else
      return "O"
  end
end

def play
  until over?
    turn
  end
  if won?
   winner == "X" || winner == "O"
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
