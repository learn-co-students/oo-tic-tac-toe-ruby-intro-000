require "pry"


# @board[]

class TicTacToe

  def initialize
    @board = Array.new(9, " ")
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

  def move(index, player = "X")
    # binding.pry
    @board[index] = player
  end

  def position_taken?(user_input)
    # if @board[user_input] == " "
    #   return false
    # else
    #   return true
    # end

    @board[user_input] != " "

  end

def valid_move?(index)
  # binding.pry
  if !position_taken?(index) && index.between?(0,8)
    return true
  else
    false
  end
end

def turn_count
  #  returns the number of turns
  #  based on the @board variable.
  #  counts occupied positions

  @board.count do |turn|
    turn == "X" || turn == "O"
    # @board.count {|square| square != " "}
  end
  end

  def current_player
    #  turn_count.even? ? "X" : "O"
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "choose a position between 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
  if valid_move?(index)
    move(index,current_player)
  else
    turn
  end
  display_board
  end

  def won?
    # if all positions are taken
    # how do we know if the game is won

    WIN_COMBINATIONS.each do |combo|
      # binding.pry
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
        return combo
      end
      end
         return false
    end

    def full?

    # @board.all?{|square| square != " " }

      @board.each do |game|
        # binding.pry
        if game != "X" && game != "O"
          return false
        end
      end
    end

    def draw?
      # binding.pry
        if @board == full? && !won?
          return true
        elsif @board == won?
          return false
        end
    end

    def over?
      if won? || draw?
        return true
      end
    end

    def winner

    # if combo = won?
    #   @board[combo[0]]
    # end

      WIN_COMBINATIONS.each do |combo|
        # binding.pry
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
          return "X"
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return "O"
        end
    end
    nil
  end


  def play

# def play
#   turn until over?
#   puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
# end

      until over?
         turn
      end

    if winner == "X"
        puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end


  end
