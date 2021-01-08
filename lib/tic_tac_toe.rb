class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
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
  def move(space, token)
    @board[space] = token
  end
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end
  def valid_move?(position)
    position.between?(0, @board.length) && !position_taken?(position)
  end
  def turn_count
    @board.count { |space| space == "X" || space == "O" }
  end
  def current_player
    turns = turn_count
    turns % 2 == 0 ? "X" : "O"
  end
  def turn
    puts "Enter input 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      puts "Invalid input, try again"
      turn
    end
    move(index, current_player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
        return combo
      end
    end
    return false
  end
  def full?
    turn_count == @board.length
  end
  def draw?
    full? && !won?
  end
  def over?
    full? || won? || draw?
  end
  def winner
    won? ? @board[won?[0]] : nil
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
