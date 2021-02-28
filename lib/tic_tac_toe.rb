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
    index = "#{user_input}".to_i - 1
  end

  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] ==" "
      false
    elsif @board[index] ==""
      false
    elsif @board[index] ==nil
      false
    else @board[index] =="X" || @board[index] =="O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if "#{turn}" == "X" || "#{turn}" == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? == true ? "X" : "O"
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
    WIN_COMBINATIONS.any? do |win_combination|
      if @board[win_combination[0]]=="X" && @board[win_combination[1]]=="X" && @board[win_combination[2]]=="X"
        return win_combination
      elsif @board[win_combination[0]]=="O" && @board[win_combination[1]]=="O" && @board[win_combination[2]]=="O"
        return win_combination
      end
    end
  end

  def full?
    @board.all? {|index| index!=" "}
  end

  def draw?
    won = won?
    full = full?
    if won==false && full==true
      return true
    elsif won==false && full==false
      return false
    else won!=false
      return false
    end
  end

  def over?
    won = won?
    draw = draw?
    full = full?
    if won!=false || draw==true || full==true
      return true
    else
      return false
    end
  end

  def winner
    won = won?
    if won!=false
      return @board[won?[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != true && winner == "X"
      puts "Congratulations X!"
    elsif won? != true && winner == "O"
      puts "Congratulations O!"
    else draw? == true
      puts "Cat's Game!"
    end
  end
end
