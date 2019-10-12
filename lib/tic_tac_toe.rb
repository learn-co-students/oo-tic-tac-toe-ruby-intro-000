class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


def won?
  for win_combo in WIN_COMBINATIONS do

    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]


    if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
      return win_combo

    elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
      return win_combo
    end
  end
  return false
end

def full?
  full = true
  for space in @board do
    if space == "X" || space == "O"
      next
    else
      full = false
      return full
    end
  end
  return full
end

def draw?
  !won? && full? ? true : false
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  if won?
    win_place = won?[0]
    return @board[win_place]
  else
    nil
  end
end



# Define your play method below
def play

  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end

end
end
