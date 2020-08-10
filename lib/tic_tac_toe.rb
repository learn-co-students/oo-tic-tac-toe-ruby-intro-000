class TicTacToe
  def initialize(board = nil)
    @board = (board || Array.new(9, " "))
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

def input_to_index(input)
  input.to_i - 1
end

def move(position, value)
  @board[position] = value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn_count
  counter = 0
  @board.each do |board_space|
    board_space != " " ? counter += 1 : nil
end
  return counter
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index, token)
  else
    puts "Please try again"
    turn
  end
    display_board
end


def won?
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
     return win_combo
   elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    end
  end
  if (@board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] || @board == ["","","","","","","","",""])
    return false
  end
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?
 if !won? && full?
   return true
 end
end

def over?
  if won? || full? || draw?
    return true
  end
end

def winner
  win_combo = won?
  if won?
    token = win_combo[0]
    if @board[token] == 'X'
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over?
    turn
    current_player
  end
  if won?
    the_winner = winner
    puts "Congratulations #{the_winner}!"
  else
    puts "Cat's Game!"
  end
end

end
