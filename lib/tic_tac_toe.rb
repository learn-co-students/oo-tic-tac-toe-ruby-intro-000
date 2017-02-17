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
    line = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts line
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts line
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(location)
    !position_taken?(location) && location < 9 && location >= 0
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count % 2 == 0 || turn_count == 0
      "X"
    else
      "O"
    end
  end

  def turn
    ui = gets.strip
    index = input_to_index(ui)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|i| @board[i] == "X"}
        return win_combination
      elsif win_combination.all?{|i| @board[i] == "O"}
        return win_combination
      else
        false
      end
    end
    if @board.all?{|ele| ele == " "}
      false
    end
  end

  def full?
    @board.all?{|ele| ele == "X" || ele == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner

    if draw?
      nil
    elsif !won?
      nil
    elsif won?.all?{|i| @board[i] == "X"}
      "X"
    elsif won?.all?{|i| @board[i] == "O"}
      "O"
    end
  end

  def play

    until over?
      puts "Enter a number 1-9:"
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
