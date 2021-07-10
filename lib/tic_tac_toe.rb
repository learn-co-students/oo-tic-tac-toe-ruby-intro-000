class TicTacToe
  def initialize(board = Array.new(9, " "))
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, value = "X")
    @board[input] = value
  end

  def position_taken?(input)
    @board[input] != " " ? true : false
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input) ? true : false
  end

  def turn_count
    counter = 0
    @board.each do |value|
      if value == "X" || value == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input = gets.strip
    input = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_combination[0])
        return win_combination
      else
        false
      end
    end
  end

  def full?
    @board.all? do |value|
      value != " " ? true : false
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if win_combination = won?
      @board[win_combination.first]
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
