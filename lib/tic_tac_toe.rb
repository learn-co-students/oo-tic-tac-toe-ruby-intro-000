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

  def input_to_index(input)
    input.to_i-1
  end

  def position_taken?(location)
    @board[location] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player
    turn_count % 2 ==1 ? "O" : "X"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token)
    @board[index] = token
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

    #winning

  def winning_combo?(win_combo, token)
    win_combo.all? do |spot|
      @board[spot] == token
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      winning_combo?(win_combo, 'X') || winning_combo?(win_combo, 'O')
    end
  end

  def full?
    @board.all? do |spot|
      spot != " "
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_combo = won?
    if winning_combo
      return @board[winning_combo[0]]
    else
      return nil
    end
  end

  #play

  def play
    display_board
    while !over?
      turn
    end
    if draw?
      puts("Cat's Game!")
    else
      puts("Congratulations #{winner}!")
    end
  end
end
