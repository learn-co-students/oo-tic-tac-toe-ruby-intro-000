class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " "," ", " "]
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
    @index = user_input.to_i - 1
  end

  def move(index, player="X")
    @index = index
    @board[@index] = player
  end

  def position_taken?(index)
    @index = index
    !(@board[@index].nil? || @board[@index] == " ")
  end

  def valid_move?(index)
    @index = index
    (position_taken?(@index) == false) && (0..8).include?(@index)
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  @index = input_to_index(input)

    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|pos| pos == "X" || pos == "O"}
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    if @board.all? {|pos| pos == " " || pos == nil}
      return false
    end

    WIN_COMBINATIONS.each do |arr|
      if position_taken?(arr[0]) && @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]]
        @winningarr = arr
        return arr
      end
    end
    false
  end

  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  def winner
    if won?
      return @board[@winningarr[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
