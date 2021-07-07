class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # WIN_COMBINATIONS
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

  # display_board method
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # input_to_index method
  def input_to_index(input)
    input.to_i - 1
  end

  # move method
  def move(index, character)
    @board[index] = character
  end

  # position_taken? method
  def position_taken?(index)
    if @board[index] == " "
      return false
    elsif @board[index] == ""
      return false
    elsif @board[index] == nil
      return false
    else @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  # valid_move? method
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      return true
    end
  end

  # turn method
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

  # turn_count method
  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  # current_player method
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  # won? method
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  # full? method
  def full?
    #use detect method - example
    if @board.detect{|i| i == " " || i == nil}
      return false
    else
      return true
    end
  end

  # draw? method
  def draw?
    if !won? && full?
      return true
    else
      false
    end
  end

  # over? method
  def over?
    if won? || draw? || full?
      return true
    else
      false
    end
  end

  # winner method
  def winner
    if win_combination = won?
      @board[win_combination.first]
    end
  end

  # play method
  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end
end
