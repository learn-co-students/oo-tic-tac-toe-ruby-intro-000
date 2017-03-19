class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS =
  [
    [0,1,2], #win top row
    [3,4,5], #win middle row
    [6,7,8], #win bottom row
    [0,3,6], #win left column
    [1,4,7], #win middle columns
    [2,5,8], #win right column
    [0,4,8], #win diagonal left to right
    [2,4,6]  #win diagonal right to left
  ]

  def display_board
    puts " #{@board [0]} " "|" " #{@board [1]} " "|" " #{@board [2]} "
    puts "-----------"
    puts " #{@board [3]} " "|" " #{@board [4]} " "|" " #{@board [5]} "
    puts "-----------"
    puts " #{@board [6]} " "|" " #{@board [7]} " "|" " #{@board [8]} "

  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " or @board[index] == "" or @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if (0..8).include?(index) && position_taken?(index) == false
      true
    else
      false or nil
    end
  end

  def turn
    turn_count
    
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)

    if valid_move?(index)

      move(index, current_player)
      display_board

    else
      puts "Please enter 1-9:"
      user_input = gets.chomp
    end
  end

  def turn_count
    @board.count do |turn|
       turn == "X" or turn == "O"
    end
  end

  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = win_index_1
      position_2 = win_index_2
      position_3 = win_index_3
        if (@board[position_1] == @board[position_2] and @board[position_1]== @board[position_3]) &&
          position_taken?(position_1) && position_taken?(position_2) && position_taken?(position_3)
          true
        else
          false
        end
      end
    end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    won?

    if !(full?)
      false
    elsif full? && !(won?)
      true
    else full? && won?
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
    if !(won?)
      nil
    elsif @board[won?[0]] == "X"
      "X"
    else @board[won?[0]] == "O"
      "O"
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
