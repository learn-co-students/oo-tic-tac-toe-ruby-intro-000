
class TicTacToe
  WIN_COMBINATIONS = [
     [0,1,2], #top row
     [0,3,6], #left column
     [0,4,8], #top left diagonal
     [1,4,7], #mid column
     [2,4,6], #top right diagonal
     [2,5,8], #right column
     [3,4,5], #mid row
     [6,7,8]  #bottom row
   ]
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
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, c_player)
    @board[index] = c_player
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      false
    else
      true
    end
  end

  def valid_move?(index)
    if (index.between?(0,8) && !(position_taken?(index)))
      true
    else
      false
    end
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

  def turn_count
    counter = 0
    @board.each do |square|
      if square == "X" || square == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? { |i| position_taken?(i)}
        if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]]
          return win_combination
        end
      end
    end
      return false
  end

  def full?
    @board.all?{ |i| i == "X" || i == "O" }
  end

  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  # Define your play method below
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
