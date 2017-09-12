class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == " " ||
      @board[index] == ""
    return false
    elsif @board[index] == "X" ||
      @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
  if index.between?(0, 8) == true && position_taken?(index) == true
    return false
  elsif index.between?(0, 8) == true
    return true
  end
end

def turn_count
  counter = 0
  @board.each do |index|
    if index =="X" || index =="O"
      counter +=1
    end
  end
  counter
end

def current_player
  if turn_count.even?
    player = "X"
  else
    player = "O"
  end
end

def turn
puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)

if valid_move?(index) == true
  move(index, current_player)
  display_board
else
  turn
end
end

def won?

  winning_combination = WIN_COMBINATIONS.select do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
      return win_combination
    elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
      return win_combination
    end
  end

  empty_board = @board.all? do |board_index|
    board_index == nil || board_index == " "
  end

  if empty_board
    return false
  elsif empty_board == false && winning_combination == []
    return false
  end
end

def full?
  full_board = @board.all? do |board_index|
    board_index == "X" || board_index == "O"
  end
  incomplete_board = @board.all? do |board_index|
    board_index == "X" || board_index == "O" || board_index = ""
  end
  if full_board
    return true
  elsif incomplete_board
    return false
  end
end

def draw?
  if full? == true && won? == false
    return true
  else
    return false
    end
end

def over?
 if won? && full? == true
   return true
 elsif won? && full? == false
     return true
   elsif draw? == true
     return true
   else
     return false
   end
 end

 def winner
  if won? == false
    return nil
  else @board[won?[0]]
end
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
