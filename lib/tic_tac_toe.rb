class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    while !(over?)
      turn
    end
    if !(draw?)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == !(" " || "" || nil) || @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0, 8) && !(position_taken?(index))
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |move|
      @board[move[0]] == @board[move[1]] &&
      @board[move[1]] == @board[move[2]] &&
      position_taken?(move[0])
    end
  end

  def full?
    @board.all?{|move| move == "X" || move =="O"}
  end

  def draw?
    !(won?) && full?
  end

    def over?
    won? || draw? || full?
  end

  # winner method
  def winner
    if won?
      @board[won?.first]
    end
  end

end
