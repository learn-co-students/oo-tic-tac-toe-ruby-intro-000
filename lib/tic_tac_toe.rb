class TicTacToe
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count() % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player()
    if valid_move?(index)
      move(index, token)
      display_board()
    else
      turn()
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1  == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1  == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.detect do |space|
      if space == " " || space == ""
        return false
      end
    end
      return true
  end

  def draw?
    bool = full?()
    if !won?() && bool
      return true
    elsif !bool && !won?()
      return false
    elsif won?() != false
      return false
    end
  end

  def over?
    if won?() != false || draw?() || full?()
      return true
    else
      return false
    end
  end

  def winner
    win = won?()

    if win != false
      place1 = win[0]

      if @board[place1] == "X"
        return "X"
      elsif @board[place1] == "O"
        return "O"
      end

    end
  end

  def play
    until over?()
      turn()
    end
    if winner() == "X" || winner() == "O"
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
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
end
