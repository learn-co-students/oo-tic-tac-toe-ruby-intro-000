class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                      [0,3,6],[1,4,7],[2,5,8],
                      [0,4,8],[2,4,6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def move(index_position, symbol)
    @board[index_position - 1] = symbol
  end

  def position_taken?(position)
    @board[position] == " " ? false : true
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i - 1)
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn_count
    @board.reject{|slot| slot == " " }.size
  end

  def turn
    puts("Enter your position")
    user_input = gets.to_i
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      (@board[win_combo[0]]  == "X" && @board[win_combo[1]]  == "X" && @board[win_combo[2]]  == "X" ||
      @board[win_combo[0]]  == "O" && @board[win_combo[1]]  == "O" && @board[win_combo[2]] == "O")
    end
  end

  def full?
    @board.any?{|item| item == " "} ? false : true
  end

  def draw?
    won? == nil && full? == true
  end

  def over?
    draw? || won?
  end

  def winner
    if over? && won?
      winning_board = won?
      @board[winning_board[0]] == "X" ? "X" : "O"
    elsif draw?
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end

  end

end
