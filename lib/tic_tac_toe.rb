class TicTacToe

  def initialize(board = Array.new(9," "))
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    (@board[index] == "X") || (@board[index] == "O")
  end

  def valid_move?(index)
    (!position_taken?(index)) && (index.between?(0,8))
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if ((position == "X") || (position == "O"))
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 1
      "O"
    else
      "X"
    end
  end

  def turn
    puts "Where would you like to go? (1-9)"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      puts "Invalid move."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|index| @board[index] == "X"}
        return combination
      elsif combination.all? {|index| @board[index] == "O"}
        return combination
      else
        false
      end
    end
    false
  end

  def full?
    @board.all? {|index| (index == "X" || index == "O")}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end













end
