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
  [6,4,2]
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

def move(position, current_player = "X")
  index = input_to_index(position)
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(position)
  index = input_to_index(position)
  index.between?(0,8) && !position_taken?(index)
end
# play a turn methods END

#decide curent player methods START
def turn_count
  count = 0
  @board.each do |entry|
    if (entry == "X" || entry == "O")
      count += 1
    end
  end
  count
end

def current_player
  turn_count.even? ? "X" : "O"
end
#decide curent player methods END

# play a turn START
def turn
  puts "Please enter 1-9:"
  position = gets.strip

  if valid_move?(position)
    move(position, current_player)
    display_board
  else
    turn
  end
end
# play a turn END

# game status methods
def won?
  WIN_COMBINATIONS.each do |indices|
    result = indices.map { |i| @board[i] }
    if result == ["X", "X", "X"] || result == ["O", "O", "O"]
      return result[0]
    end
  end
  false
end

def full?
  !@board.any? { |index| index == " " || index == "" || index == nil}
end

def draw?
  !won? && full?
end

def over?
  draw? || won? || full?
end

def winner
  won? || nil
end

# Define your play method below
def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end
end
