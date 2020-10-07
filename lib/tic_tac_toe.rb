require 'pry'
class TicTacToe

  def initialize
    board = Array.new(9, " ")
    @board = board
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal 1
    [2,4,6]  #Diagonal 2
  ]

  def input_to_index(input)
    index = input.to_i
    index -= 1
    return index
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  while !valid_move?(index)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
  move(index, current_player)
  display_board
  end

  def turn_count
    counter = 0
    @board.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |match|
      @board[match[0]] == @board[match[1]] &&
      @board[match[1]] == @board[match[2]] &&
     position_taken?(match[0])
    end

  end

  def full?
    @board.all? do |taken|
      taken == "X" || taken == "O"
    end
  end

  def draw?
!(won?) && full?
end

  def over?
    if draw?
      return true
    elsif won? && !(full?)
      return true
    elsif won? && full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      if turn_count % 2 != 0
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

end
