class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
  index = user_input.to_i-1
  return index
end

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  if @board[index] == ""
    return false
  elsif @board[index] == " "
    return false
  elsif @board[index] == nil
    return false
  else @board[index] == "X" || "O"
    return true
  end
end

def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8) == true
    true
  else
    false
  end
end

def turn_count
  turn = 0
  @board.each do |entry|
    if entry == "X" || entry == "O"
      turn += 1
    end
  end
  return turn
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  user_input= input_to_index(input)
  if valid_move?(user_input)
    move(user_input, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win_array|
    win_array.each do |win_index|
      if @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[1])
        return win_array
      end
    end
  end
  return false
end

def full?
  @board.all? do |input|
    input == "X" || input == "O"
  end
end

def draw?
  !won? && full?
end

def over?
  if full? && draw? || won?
    return true
  end
  return false
end

def winner
  WIN_COMBINATIONS.each do |win_array|
    win_array.each do |win_index|
      if @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[1])
        return @board[win_array[0]]
      end
    end
  end
return nil
end

def play
  until over? do
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts "Cat's Game!"
  end
end
end
