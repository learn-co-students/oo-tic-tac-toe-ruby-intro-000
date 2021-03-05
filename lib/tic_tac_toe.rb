class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(user_input)
    return (user_input.to_i - 1)
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
    return false
  end

  def valid_move?(index)
    if index > 8 || index < 0
    return false
    end
    if position_taken?(index)
      return false
    end
    return true
  end

  def turn
    puts "Please enter a number 1-9: "
    user_input = gets.chomp
    user_input = input_to_index(user_input)
    current = current_player
    if valid_move?(user_input)
      move(user_input, current)
      display_board
    else
      puts "Please enter a valid input 1-9: "
      turn
    end
  end

  def won?
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  return false
end

# Determines if the board is in a full state
def full?
  if @board.include?(" ") || @board.include?("")
    return false
  end
  return true
end

def draw?
  if full? && !won?
    return true
  end
  return false
end

# Determines if the game is over based on the boards state
def over?
  if won? || draw?
    return true
  end
  return false
end

# Determines if there is a winner based on the boards state
def winner
  win_combo = won?
  if !win_combo
    return nil
  elsif (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X")
    return "X"
  elsif (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
    return "O"
  end
end

def play
  until over? do
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    win = winner
    puts "Congratulations #{win}!"
  end
end
end
