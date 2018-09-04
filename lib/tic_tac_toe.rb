class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
    # Helper Method
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

    def valid_move?(pos)
      pos.between?(0,8) && !position_taken?(pos)
    end

    def position_taken?(pos)
      !([pos].nil? || @board[pos] == " ")
    end


    def turn
      #This is my method NOT using recursion
      puts "Please enter 1-9:"
      input = input_to_index(gets.chomp)
      if valid_move?(input) == false
        input = gets.chomp
      else
        move(input, current_player)
      end
      display_board
    end

    def play
      turn_num = 0
      while turn_num < 10 && !over?
        turn()
        turn_num +=1
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

    def turn_count
      count = 0
      @board.each do |pos|
        if pos != " "
          count +=1
        end
      end
      return count
    end

    def current_player
      if turn_count.even?
        return "X"
      end
      return "O"
    end


    # END GAME SHIZZ


    WIN_COMBINATIONS = [
      [0,1,2], # top row
      [3,4,5], # middle rows
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right column
      [0,4,8], # diagonal one
      [2,4,6] # diagonal two
    ]

    def won?
      WIN_COMBINATIONS.each do |win|
        if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
          return win
        elsif
          @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
            return win
        end
      end
        return false
      end

    def full?
      return true unless @board.include?(" ")
    end

    def draw?
     if full? && !won?
       return true
      end
      return false
    end

    def over?
      return true while (draw? || won?)
      return false
    end

    def winner
      if won? && @board[won?()[0]]  == "X"
        return "X"
      elsif won? && @board[won?()[0]] == "O"
        return "O"
      end
      return nil
    end


end
