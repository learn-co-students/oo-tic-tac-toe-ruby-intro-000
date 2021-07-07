class TicTacToe
	  def initialize(board = nil)
	    @board = board || Array.new(9, " ")
      @player_X_O = 1
      @winner_X_O = ""
	  end

    WIN_COMBINATIONS =
      [
        [0,1,2], # top row
        [3,4,5], # middle row
        [6,7,8], # bottom row
        [0,3,6], # left column
        [1,4,7], # middle column
        [2,5,8], # right columnlib
        [0,4,8], # left diagonal
        [2,4,6]  # right diagonal
      ]

    def display_board
	      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	      puts "-----------"
	      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	      puts "-----------"
	      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	  end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token)
        @board[index] = "#{token}"
    end

    def position_taken?(index)
      if @board[index] != " " && @board[index] != "" && @board[index] != nil
        true
      else
        false
      end
    end

    def valid_move?(index)
      if position_taken?(index) || !index.between?(0, 8)
        false
      else
        true
      end
    end

    def turn
      puts "Player #{@player_X_O} please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if !valid_move?(index)
        turn
      else
        token = current_player
        move(index, token)
        display_board
        if @player_X_O == 1
          @player_X_O = 2
        else
          @player_X_O = 1
        end
      end
    end

    def turn_count
      count = 0
      @board.each {| elem | elem == "X" || elem == "O" ? count += 1 : count = count}
      return count
    end

    def current_player
      count = turn_count
      count % 2 == 0 ? (return "X") : (return "O")
    end

    def won?
      WIN_COMBINATIONS.each do | win_combination |
        if (position_taken?(win_combination[0]) && position_taken?(win_combination[1]) && position_taken?(win_combination[0])) &&
          ((@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") ||
            (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"))
              @winner_X_O = @board[win_combination[0]]
              return win_combination
        else
            false
        end
      end
        return false
    end

    def full?
      full_array = @board.select {| elem | elem == " " || elem == "" or elem == nil}
      if full_array.length > 0
        return false
      else
        return true
      end
    end

    def draw?
      if won? || !full?
        return false
      else
        return true
      end
    end

    def over?
      if won? || full? || draw?
        return true
      else
        return false
      end
    end

    def winner
      if won?
        return @winner_X_O
      else
        return nil
      end
    end

    def play
      display_board
      until over?
        turn
      end
      if won?
        puts "Congratulations #{@winner_X_O}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
