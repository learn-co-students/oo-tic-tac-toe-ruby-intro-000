class TicTacToe

  def initialize
    @board = Array.new(9, " ")
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

    board = @board

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

  end


    def input_to_index(user_input)
      if user_input.to_i.class != Fixnum
        return -1
      end
      user_input = user_input.to_i
      user_input -=1
    end

    #Sets the position of the board to "X" or "O"
    def move (index, token)
      #token = current_player(board)
      @board[index] = token
    end

    #returns true if a space on the board is occupied
    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end

    #returns true if a move is valid
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
      turn_counter = 0
      @board.each do |spot|
        if spot == "X" || spot.upcase == "O"
          turn_counter +=1
        end
      end
      return turn_counter
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        win_combination = [combo[0], combo[1], combo[2]]
        windex1 = win_combination[0]
        windex2 = win_combination[1]
        windex3 = win_combination[2]

        pos1 = @board[windex1]
        pos2 = @board[windex2]
        pos3 = @board[windex3]
        win_combo = [pos1,pos2,pos3]

        if pos1 == "X" && pos2 == "X" && pos3 == "X" || pos1 =="O" && pos2 == "O" && pos3 == "O"
          return win_combination
      end
    end
      return false
    end

    def full?
        if @board.any? {|token| token == " "}
          return false
        else
          return true
        end
    end

    def draw?
      if !won? && full?
        return true
      else
        return false
      end
    end

    def over?
      if draw? || won?
        true
      else
        false
      end
    end

    def current_player
      if turn_count % 2 == 0
        return "X"
      else
        return "O"
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      token = current_player
      if valid_move?(index)
        move(index, token)
        display_board
      else
        turn
      end
    end

    def winner
      if won?
        what_is_it = won?
        return @board[what_is_it[0]]
      else
        return nil
      end
    end

    def play
      until over?
        turn

      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end

end
