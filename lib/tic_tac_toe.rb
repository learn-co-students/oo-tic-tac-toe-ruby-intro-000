class TicTacToe
  def initialize(board = nil)
    @board =  Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], #top
    [3,4,5], #Middle
    [6,7,8], #bottom
    [0,3,6], #left
    [1,4,7], #midddle column
    [2,5,8], #right
    [0,4,8], #left diagonal
    [2,4,6]  #right diagonal
  ]

  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    input = num.to_i
    input -= 1
    return input
  end
  def move(position, player)
    @board[position] = player
  end

  def position_taken?(index)
    if(@board[index] == "X" || @board[index] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count()
    count = 0
    @board.each do |ele|
      if (ele == "X" || ele == "O")
        count+= 1
      end
    end
    return count
  end
  def current_player()
    if (turn_count() % 2 == 0)
      return "X"
    else
      return "O"
    end
  end

  def turn()
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if (valid_move?(index))
       move(index, current_player())
     else
       turn()
     end
     display_board()
  end



  def full?()
      if (@board.include?(" "))
        return false
      else
        return true
      end
    end

    def won?()

      if(!@board.include?("X") && !@board.include?("O"))
        return nil
      end

      WIN_COMBINATIONS.each do |combination|
        index1 = combination[0]
        index2 = combination[1]
        index3 = combination[2]
        arr = [index1, index2, index3]
        if (@board[index1] == "X" && @board[index2] == "X" && @board[index3] == "X")
          return arr
        end
        if (@board[index1] == "O" && @board[index2] == "O" && @board[index3] == "O")
          return arr
        end
      end
      return false
    end

    def draw?()
      if (full?() && !won?())
        return true
      end
      return false
    end

    def over?()
      if(draw?() || won?())
        return true
      else
        return false
      end
    end

    def winner()
        if(winner = won?())
          return @board[winner[0]]
        else
          return nil
        end
    end

    def play()
      while(!over?())
        turn()
      end
      if(winner())
        puts "Congratulations #{winner()}!"
      else
        puts "Cat's Game!"
      end
    end
end
