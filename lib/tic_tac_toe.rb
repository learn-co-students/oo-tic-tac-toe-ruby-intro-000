class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
      counter += 1
      else
      end
    end
    return counter
  end

  def current_player
    x_count = 0
    o_count = 0
    @board.each do |value|
      if value == "X"
        x_count += 1
      elsif value == "O"
        o_count += 1
      else
        nil
      end
    end
    if x_count == o_count
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid input."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        else
          nil
        end
    end
  end

  def full?
    @board.all? do |spaces|
      if spaces == "X" || spaces == "O"
        true
      else
        false
      end
    end
  end

  def draw?
    won = won?
    filled = full?
    if won == nil && filled == true
      true
    elsif won.is_a?(Array) == true
      false
    elsif won == nil && filled == false
      false
    end
  end

  def over?
    if draw? == true || full? == true || won? != nil
      true
    else
      false
    end
  end

  def winner
    victor = won?
      if victor.is_a?(Array) == true
        return @board[victor[0]]
      else
        nil
      end
  end

def play
  until over? == true
    turn
  end
  if won?.is_a?(Array) == true
    if current_player == "X"
      player = "O"
    else
      player = "X"
    end
    puts "Congratulations #{player}!"
  elsif draw? == true
    puts "Cat's Game!"
  end
end
end
