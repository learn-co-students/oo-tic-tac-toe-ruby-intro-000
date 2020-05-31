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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, marker)
    @board[index]=marker
  end

  def position_taken? (index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && (index).between?(0,8)
      return true
    else
      return false
    end
  end

  def turn_count
    counter = 0
    @board.each {|space|
      if space == "X" || space == "O"
        counter += 1
      end
    }
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |single_win_combo|
      win_index_1 = single_win_combo[0]
      win_index_2 = single_win_combo[1]
      win_index_3 = single_win_combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        return single_win_combo
      end
    end
    return false
  end

  def full?
    if @board.any? {|index| index == nil || index == " "}
      return false
    end
    return true
  end

  def draw?
    if !won? && full?
      return true
    elsif !full? && !won?
      return false
    else won?
      return false
    end
  end

  def over?
    if draw? || won? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
