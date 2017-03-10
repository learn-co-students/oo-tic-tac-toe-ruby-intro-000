class TicTacToe
  def initialize board = nil
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index input
    input.to_i - 1
  end

  def move index, token = "X"
    @board[index] = token
  end

  def position_taken? location
    @board[location] != " " && @board[location] != "" && @board[location] != nil

  end

  def valid_move? index
    index.between?(0, 8) && !position_taken?(index)
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

  def turn_count
    turns = 0
    @board.each do |index|
      if index != " " && index != "" && index != nil
        turns += 1
      end
    end
    return turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |x|
      return x if x.all? { |i| @board[i] == "X" }
      return x if x.all? { |i| @board[i] == "O" }
    end
  end

  def full?
    @board.none? { |i| i.nil? || i == " " || i == ""}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    return nil if !won?
    return "X" if won?.all? { |i| @board[i] == "X" }
    return "O" if won?.all? { |i| @board[i] == "O" }
  end

  def play
    until over?
      turn
    end

    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end
end
