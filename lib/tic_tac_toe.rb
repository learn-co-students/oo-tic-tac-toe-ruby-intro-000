class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    if index < 0 || index > 8
      return false
    elsif @board[index] == " "
      return true
    else
      return false
    end
  end

  def turn_count
    count = @board.select{|i| i!= " "}
    return count.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      puts "Please try again"
      turn
    end
  end

  def won?
    winner = []
    WIN_COMBINATIONS.each do |combo|
      value_1 = @board[combo[0]]
      value_2 = @board[combo[1]]
      value_3 = @board[combo[2]]

      if value_1 == 'X' && value_2 == 'X' && value_3 == 'X'
        winner = combo
      elsif value_1 == 'O' && value_2 == 'O' && value_3 == 'O'
        winner = combo
      end
    end

    winner.length == 3 ? winner : false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if !won?
      return nil
    elsif @board[won?[0]] == 'X'
      return 'X'
    elsif @board[won?[0]] == 'O'
      return 'O'
    end
  end

  def play
    until over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    elsif winner == 'X'
      puts "Congratulations X!"
    elsif winner == 'O'
      puts "Congratulations O!"
    end
  end

end
