class TicTacToe

  def initialize(board=nil)
    @board = Array.new(9, " ")
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
    input.to_i-1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " " ? true : false
  end

  def valid_move?(index)
    if position_taken?(index) == false && index >= 0 && index <= 8
      return true
    else return false
    end
  end

  def turn_count
    @board.count do |slot|
      slot == "X" || slot == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index1 = win_combo[0]
      win_index2 = win_combo[1]
      win_index3 = win_combo[2]

      if @board[win_index1] == "X" && @board[win_index2] == "X" && @board[win_index3] == "X"
        @winner = "X"
        return win_combo
      elsif @board[win_index1] == "O" && @board[win_index2] == "O" && @board[win_index3] == "O"
        @winner = "O"
        return win_combo
      end
    end
    return false
  end

  def full?
    @board.all? do |slot|
      slot == "X" || slot == "O"
    end
  end

  def draw?
    if !won? && full?
      return true
    else return false
    end
  end

  def over?
    if won? || draw?
      return true
    else return false
    end
  end

  def winner
    if won? != false
      return @winner
    else return nil
    end
  end

  win_message = puts "Congratulations #{@winner}!"
  draw_message = puts "Cat's Game!"

  def play
    until over? do
      turn
    end
    if won? != false
      puts "Congratulations #{@winner}!"
    else puts "Cat's Game!"
    end
  end

end
