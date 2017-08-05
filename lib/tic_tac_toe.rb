class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [2, 5, 8],
    [1, 4, 7]
  ]

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index)== false && index.between?(0, 8)
      return true
    else
      return false
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn != " " && turn != ""
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
      current_player
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
