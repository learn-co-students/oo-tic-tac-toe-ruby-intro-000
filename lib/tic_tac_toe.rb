class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # First column
    [1,4,7],  # Second column
    [2,5,8],  # Third column
    [0,4,8],  # Top left to bottom right
    [2,4,6]  # Top right to bottom left
  ]

  #HELPER METHODS
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index >= 0 && index <= 8
      if position_taken?(index) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn
    token = current_player
    puts "It's #{token}'s turn."
    puts "Please enter 1 - 9:"
    index = input_to_index(gets.chomp)
    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      puts "This is not a valid move."
      turn
    end
  end

  def turn_count
    moves_made = @board.select do |i|
      i == "X" || i =="O"
    end
    return moves_made.length
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |i|
      @board[i[0]] == @board[i[1]] &&
      @board[i[1]] == @board[i[2]] &&
      position_taken?(i[0])
    end
  end

  def full?
    if turn_count >= 9
      return true
    else
      return false
    end
  end

  def draw?
    if !won? && full? == true
      return true
    else
      return false
    end
  end

  def over?
    if !won? == false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    if won?.class == Array
      return @board[won?[0]]
    else
      return nil
    end
  end


  #PLAY METHOD
  def play
    until over? == true
      turn
    end

    if !won? == false
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
