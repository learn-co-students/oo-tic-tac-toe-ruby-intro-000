class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # leading diagonal
    [2, 4, 6]  # other diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, token)
    @board[pos.to_i - 1] = token
  end

  def position_taken?(pos)
    @board[pos] == "X" || @board[pos] == "O"
  end

  def valid_move?(pos)
    pos.to_i.between?(1, 9) && !position_taken?(pos.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    pos = gets.strip
    if valid_move?(pos)
      move(pos, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|value| value=="X" || value=="O"}
  end

  def current_player
    turn_count%2==0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all?{|i| @board[i]=="X"} || combination.all?{|i| @board[i] == "O"}
    end
  end

  def full?
    @board.all? {|value| value=="X" || value=="O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    display_board
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
