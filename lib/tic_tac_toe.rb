class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if (@board[index].nil? || @board[index] == " ")
      return false
    else
      return true
    end
  end

  def position_free?(index)
    @board[index] == " " || @board[index] == "" || @board[index] == nil
  end

  def valid_move?(index)
    index >= 0 && index <= 8 && position_free?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    until valid_move?(index)
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    end
    move(index, current_player)
    display_board
  end

  def turn_count
    @counter = 0
    @board.each do |space|
      if space != " " && space != "" && space != nil
        @counter += 1
      end
    end
      return @counter
  end

  def current_player
    if turn_count.odd?
      return "O"
    else
      return "X"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return win_combination
      end
    end
    WIN_COMBINATIONS.none? do |win_combination|
      (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
      return false
    end
  end

  def full?
    @board.none? do |space|
      space == " " || space == "" || space == nil
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won? == false
      return nil
  else
    combination = won?
      if @board[combination[0]] == "X"
        return "X"
      elsif @board[combination[0]] == "O"
        return "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
