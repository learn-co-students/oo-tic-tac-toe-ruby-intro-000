class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  top_row_win = [0,1,2]
  middle_row_win = [3,4,5]
  bottom_row_win = [6,7,8]
  left_column_win = [0,3,6]
  middle_column_win = [1,4,7]
  right_column_win = [2,5,8]
  left_diagonal_win = [0,4,8]
  right_diagonal_win = [2,4,6]

  WIN_COMBINATIONS = [top_row_win, middle_row_win, bottom_row_win, left_column_win, middle_column_win, right_column_win, left_diagonal_win, right_diagonal_win]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, side)
  @board[index] = side
  display_board
  end

  def position_taken?(location)
  @board[location] != " " && @board[location] != "" && @board[location] != nil
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
  turn_count = 0
  @board.each do |numMoves|
    if numMoves == "X" || numMoves == "O"
      turn_count += 1
    end
  end
  return turn_count
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
  else
    turn
  end
end

  def won?
  WIN_COMBINATIONS.each do |winIndex|
    position_1 = @board[winIndex[0]]
    position_2 = @board[winIndex[1]]
    position_3 = @board[winIndex[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winIndex
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winIndex
    end
  end

  return false
end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    display_board
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
