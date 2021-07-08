class TicTacToe

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

  def initialize
    @board = Array.new(9, " ")
    @side_length = Math.sqrt(@board.length).to_i
  end

###############################################################
#HELPER METHODS

  def display_board
    horiz_bar = ""
    ((@side_length * 3) + (@side_length - 1)).times{horiz_bar += "-"}
    row = 0
    while(row < @side_length)
      spot = 0
      board_row = ""
      while(spot < @side_length)
        idx = (row * @side_length) + spot
        board_row += " #{@board[idx]} |"
        spot += 1
      end
      puts board_row.chop
      puts horiz_bar unless row == @side_length - 1
      row += 1
    end
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    index >= 0 && index < @board.length && !position_taken?(index)
  end

  def turn_count
    @board.count{|spot| spot != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    valid_move = false
    until(valid_move)
      puts "Please enter your move (1 - #{@side_length ** 2})."
      move = input_to_index(gets.strip)
      valid_move = valid_move?(move)
    end
    @board[move] = current_player
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      first_spot = @board[combo[0]]
      return combo if first_spot != " " && combo.all?{|idx| @board[idx] == first_spot}
    end
    false
  end

  def full?
    @board.length == @board.count{|spot| spot != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combo = won?
    win_combo ? @board[win_combo[0]] : nil
  end

###############################################################
#MAIN METHODS

  def play

    puts "Welcome to OO Tic Tac Toe!"
    display_board

    until over?
      turn
    end
    if(won?)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
