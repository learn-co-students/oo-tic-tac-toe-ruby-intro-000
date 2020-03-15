class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #mid column
    [2,5,8], #right column
    [0,4,8], #top left across
    [2,4,6] # top right across
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win1 = win_combo[0]
      win2 = win_combo[1]
      win3 = win_combo[2]

      position_1 = @board[win1]
      position_2 = @board[win2]
      position_3 = @board[win3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
  end

  def full?
    @board.all? {|space| space == "X" || space == "O"}
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if won? || draw?
      return true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
