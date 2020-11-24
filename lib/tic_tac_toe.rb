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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # def move(index, value = "X") ==originally had
  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif @board[index] == " "
      return false
    elsif @board[index] == ""
      return false
    elsif @board[index] == nil
      return false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && (@board[index] == " " || @board[index] == "")
      true
    elsif @board[index] == "X" || @board[index] == "O"
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    valid_move = valid_move?(index)
    if valid_move
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    num_turns = 0
    @board.each do |space|
      if "#{space}" == "X" || "#{space}" == "O"
        num_turns += 1
      end
    end
    return num_turns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
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

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
      end
    end

    false
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    if !full?
      return false
    elsif won? == false
      return true
    end
  end

  def over?
    if draw?
      return true
    elsif won?
      return true
    end
  end

  def winner
    positions_array = won?
    if positions_array == false
      return nil
    elsif @board[positions_array[0]].to_s == "X" || @board[positions_array[0]].to_s == "O"
      return @board[positions_array[0]].to_s
    end
  end

  def play
    until over?
      turn
    end
    if won? != false
      person_won = winner
      puts "Congratulations #{person_won}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
