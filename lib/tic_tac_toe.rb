class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board 
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "#{"-----------"}"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "#{"-----------"}"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|space| space == "X" || space == "O"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|space| space == "X" || space == "O"}
  end

  def draw?
    (!won? && full?)
  end

  def over?
    (won? || full? || draw?) 
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
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