class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #win_combos
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # Helper Methods
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count
    counter = 0
    @board.each{|place| place == 'O' || place == 'X'? counter += 1 : next }
    return counter
  end

  def current_player
    return turn_count() % 2 == 0? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
        if position_taken?(win_combo[0]) && position_taken?(win_combo[1]) && position_taken?(win_combo[2]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
          return win_combo
        end
    end
    return false
  end

  def full?
    counter = 0
    (0..9).each do |index|
      if position_taken?(index)
        counter += 1
      end
    end
    if counter > 8
      return true
    else
      return false
    end
  end

  def draw?
    if !won?() && full?()
      return true
    else
      return false
    end
  end

  def over?
    if won?()
      return true
    elsif full?()
      return true
    else
      return false
    end
  end

  def winner
    if won?()
      won?().each do |index|
        return @board[index]
      end
    else
      return nil
    end
  end

  def play
    until over?() || draw?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
end
