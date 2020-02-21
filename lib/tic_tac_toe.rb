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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index input
    input.to_i - 1
  end
  def move index, char
  @board[index] = char
  end
  def position_taken? index
    if @board[index] == 'X' || @board[index] == 'O'
      true
    else
      false
    end
  end
  def valid_move? index
    if index < 9 && index > -1
      !position_taken? index
    end
  end
  def turn
    char = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move? index
      move index, char
      display_board
    else
      turn
  end
end
def turn_count
  counter = 0
  @board.each do |i|
    if i == 'X' || i == 'O'
      counter += 1
    end
  end
  counter
end
def current_player
  if (turn_count).even?
    return 'X'
  else
    return 'O'
  end
end
def won?
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end
def full?
  @board.all? {|e| e != ' '}
end
def draw?
  if !won? && full?
    return true
  else
    return false
  end
end
def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end
def winner
  return @board[won?[0]] if won?
end
def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
    return
  elsif draw?
    puts "Cat's Game!"
    return
  end
end
end
