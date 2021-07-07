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
  [2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
  return @board
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

def turn
  puts "Please choose a number 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(index)
    move(index, current_player)
    display_board
  elsif !valid_move?(index)
    puts "Please enter valid number."
    turn
  else
    turn
  end
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def won?
  WIN_COMBINATIONS.each { |win_combination|
    value_1 = @board[win_combination[0]]
    value_2 = @board[win_combination[1]]
    value_3 = @board[win_combination[2]]

      if (value_1 == "X" && value_2 == "X" && value_3 == "X") || (value_1 == "O" && value_2 == "O" && value_3 == "O")
          return win_combination
      end #close if statement

  }
  return false
end

def full?
  @board.all? {|value| value == "X" || value == "O" }
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? != false
    return true
  elsif draw?
    return true
  else
    return false
  end

end

def winner
  if won? == false
    return nil
  else
    if @board[won?[0]] == "X"
      return "X"
    else
      return "O"
    end
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
