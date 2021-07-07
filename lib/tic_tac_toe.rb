class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top to bottom diagonal
  [6,4,2]  # Bottom to top diagonal
]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def current_player
  if turn_count % 2 == 0
    return "X"
  end
  "O"
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def won?
  WIN_COMBINATIONS.each do |combo|
    spot_1 = @board[combo[0]]
    spot_2 = @board[combo[1]]
    spot_3 = @board[combo[2]]

    if (spot_1 == "X" && spot_2 == "X" && spot_3 == "X") || (spot_1 == "O" && spot_2 == "O" && spot_3 == "O")
      return combo
    end
  end
  false
end

def full?
  index = 0
  until index == 9
    if !position_taken?(index)
      return false
    end
    index += 1
  end
  true
end

def draw?
  if full? && !won?
    return true
  end
  false
end

def over?
  if draw? || won?
    return true
  end
  false
end

def winner
  if won?
    combo = won?
    return @board[combo[0]]
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end

end
