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
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(spot)
    spot.to_i - 1
  end

  def move(spot, character = "X")
    @board[spot] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8)
      !position_taken?(index)
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    spot = input_to_index(input)
    if valid_move?(spot)
      move(spot, current_player)
      display_board
    else
      display_board
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combos|
      position_1 = @board[combos[0]]
      position_2 = @board[combos[1]]
      position_3 = @board[combos[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combos
      end
    end
    return false
  end

  def full?
    @board.none?{|i| i == " " or i == ""}
  end

  def draw?
    if won?
      return false
    end
    if full?
      return true
    end
    return false
  end

  def over?
    if won? || full? || draw?
      return true
    end
    return false
  end

  def winner
    combo = won?
    if !combo
      return nil
    else
      return @board[combo[0]]
    end
  end

  def play
    until over? do
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    end
  end
  
end