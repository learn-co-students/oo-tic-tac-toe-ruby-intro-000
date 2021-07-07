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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input_to_index, token = "X")
    @board[input_to_index] = token
  end

  def position_taken?(input_to_index)
    if @board[input_to_index] == "X" || @board[input_to_index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input_to_index)
    if position_taken?(input_to_index)
      return false
    elsif position_taken?(input_to_index) == false && input_to_index.between?(0,8)
      return true
    end
  end

  def turn_count
    count = 0
    i = 0
    while i < @board.length
      if @board[i] == "X" || @board[i] == "O"
        count += 1
      end

      i += 1
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end

  def turn
    puts "Number pls:"
    num = gets.chomp
    index = input_to_index(num)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    win = WIN_COMBINATIONS.each { |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        return win
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        return win
      end
    }
    return false
  end

  def full?
    if @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if won? != false && full? == true
      return false
    elsif won? == false && full? == true
      return true
    end
  end

  def over?
    if won? != false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    end
  end

  def play
    while over? == false
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
