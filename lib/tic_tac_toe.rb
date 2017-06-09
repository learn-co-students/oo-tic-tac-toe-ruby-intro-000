require "pry"

class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

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
    if @board[index] == "" or @board[index] == " "
      false
    else
      return true
    end
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
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

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board    
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? do |position|
        @board[position] == "O"
      end
      return combination
      elsif
        combination.all? do |position|
          @board[position] == "X"
        end
        return combination
      end
    end
    return false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    if won? || draw? || full?
      return true  
    end  
  end

  def winner
    if won?
      win_index = won?
      return @board[win_index[1]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end 
  
end