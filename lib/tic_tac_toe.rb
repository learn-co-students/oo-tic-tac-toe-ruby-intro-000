class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
  def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?
  WIN_COMBINATIONS.each do |win_combo|
    idx1 = win_combo[0]
    idx2 = win_combo[1]
    idx3 = win_combo[2]

    position1 = @board[idx1]
    position2 = @board[idx2]
    position3 = @board[idx3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return win_combo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return win_combo
    end
  end
  false
end

def full?
  @board.none? do |element|
    element == " "
  end
end

def draw?
  if full? && !won?
    return true
  else
    return false
  end
end

def over?
  if won? || draw? || full?
    return true
  end
  false
end

def winner
  if won? == false
    return nil
  end

  win_combo = won?

  index = win_combo[0]

  @board[index]
end

def turn_count
  counter = 0
  @board.each do |element|
    if element == "X" || element == "O"
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

def move(index, current_player)

  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
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

# Define your play method below
def play
  until over?
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
end
end
