

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
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

  def move(input, player="X")
    player = current_player
    @board[(input - 1)] = player
  end

  def position_taken?(input)
    @board[input] != " "
  end

  def valid_move?(input)
    input = input.to_i
    input.between?(1,9) && !position_taken?(input - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input.to_i
    if valid_move?(input)
      move(input)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    x_won = 0
    o_won = 0
    winning_combination = []
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        winning_combination = combination
        x_won = 1
      elsif (@board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O")
        winning_combination = combination
        o_won = 1
      end
    end

    if x_won == 1 && o_won == 0
      return winning_combination
    elsif x_won == 0 && o_won == 1
      return winning_combination
    else
      return false
    end
  end

  def full?
    return @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    else
      return nil
    end
  end


  def play
    until over?
      turn
    end
    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    else
      puts "Cats Game!"
    end
  end
end
