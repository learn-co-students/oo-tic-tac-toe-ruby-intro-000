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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    num.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if ! position_taken?(index) && index.between?(0,8)
      return true
    else
      return false
    end
  end

  def turn_count
    @board.count{|i| i != " "}
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Current Player: Please enter 1-9"
    num = gets.strip
    index = input_to_index(num)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      index0 = win_combo[0]
      index1 = win_combo[1]
      index2 = win_combo[2]
      position1 = @board[index0]
      position2 = @board[index1]
      position3 = @board[index2]
      if position1 == "X" && position2 == "X" && position3 == "X"
        return win_combo
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return win_combo
      end
    end
    return false
  end

  def full?
    # @board.all?{|i| i == "X" || i == "O"}
    @board.none?{|i| i == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      if @board[won?[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
    return nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end



end
