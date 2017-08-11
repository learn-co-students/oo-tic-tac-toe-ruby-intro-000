class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,1,2],
    [3,4,5],
    [6,7,8],
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
    position = input.to_i - 1
  end

  def move(position, char = "X")
    @board[position] = char
  end

  def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    number = gets.strip
    number = input_to_index(number)
    current_player
    if valid_move?(number)
      move(number,@player)
      display_board
    else
      puts "Sorry, your entry is not a valid move."
      turn
    end
  end

  def turn_count
    turns = @board.select{|spot| spot == "X" || spot == "O"}
    turns.size
  end

  def current_player
    @player = turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combo
      end
    end
    return false
  end

  def full?
    full = @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    draw = full? && !won?
  end

  def over?
    over = full? || draw? || won?
  end

  def winner
    if won?
      winner = @board[won?[0]]
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
