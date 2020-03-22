class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
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

def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i -  1
end

def move (index, value)
  @board[index] = value
end

def position_taken?(location)
  @board[location] == "X" || @board[location] == "O"
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count()
  counter = 0
  @board.each do |str|
    if str == "X" || str == "O"
      counter += 1
    end
  end
  counter
end

def current_player()
  if turn_count() % 2 == 0
    "X"
  else
    "O"
  end
end

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player())
    display_board()
  else
    turn()
  end
end

def won?()
  WIN_COMBINATIONS.detect do |combos|
    win_index_1 = combos[0]
    win_index_2 = combos[1]
    win_index_3 = combos[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combos
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combos
    else
      false
    end
  end
end

def full?()
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?()
  full?() && !won?()
end

def over?()
  draw?() || won?()
end

def winner()
  if won?()
    # binding.pry
     combo = won?()
     @board[combo[0]]
  end
end

def play()
  until over?()
    turn()
  end
  if won?()
    puts "Congratulations #{winner()}!"
  elsif draw?()
    puts "Cat's Game!"
  end
end

end
