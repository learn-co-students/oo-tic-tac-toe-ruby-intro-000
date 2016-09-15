class TicTacToe
  def initialize(board = nil)
    board = Array.new(9, " ")
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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(spot, current_player = "X")
    @board[spot.to_i - 1] = current_player
  end

  def position_taken?(index)
    if @board[index.to_i] == " " || @board[index.to_i] == "" || @board[index.to_i] == nil
      false
    else
      true
    end
  end

  def valid_move?(spot)
    if spot.to_i.between?(1,9) == true && position_taken?(spot.to_i - 1) == false
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    spot = gets.strip
    if valid_move?(spot)
      move(spot, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    counter = turn_count
    counter.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      first_strategy = @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
      second_strategy = @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      if first_strategy == true || second_strategy == true
        return win_combination
      end
    end
    if WIN_COMBINATIONS.none? do |win_combination|
      @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" || @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
    end
      false
    end
  end

  def full?
    @board.all?{|place| place == "X" || place == "O"}
  end

  def draw?
    victorious_array = won?
    if full? == true && victorious_array == false
      true
    else
      false
    end
  end

  def over?
    victorious_array = won?
    if victorious_array
      true
    elsif draw?
      true
    elsif full?
      true
    else
      false
    end
  end

  def winner
    victorious_array = won?
    if victorious_array
      @board[victorious_array[0]]
    end
  end

  def play
    until over?
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
