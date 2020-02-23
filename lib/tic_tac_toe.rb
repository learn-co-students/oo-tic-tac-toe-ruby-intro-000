class TicTacToe
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    current_player = "X"
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

  def current_player()
    if (turn_count(@board) % 2 == 0)
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index) do
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    puts "turn"
    player = current_player()
    move(index, player)
    display_board()
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player()
    if (turn_count() % 2 == 0)
      "X"
    else
      "O"
    end
  end

  def turn_count()
    count = 0
    @board.each do |position|
      if (position == "X" || position == "O")
        count += 1
      end
    end
    count
  end

  def empty_board?()
    @board.all? do |position|
      position != "X" && position != "O"
    end
  end

  def won?()
    result = false;
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |index| @board[index] == "X"}
        result = combination
      elsif combination.all? { |index| @board[index] == "O"}
        result = combination
      end
    end
    result;
  end

  def full?()
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?()
    full?() && !won?()
  end

  def over?()
    won?() || draw?() || full?()
  end

  def winner()
    combination = won?()
    if (combination)
      @board[combination[0]]
    else
      nil
    end
  end

  def play
    until over?() do
      turn()
    end
    if (won?())
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end

end
