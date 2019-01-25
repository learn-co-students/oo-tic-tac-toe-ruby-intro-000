# from Learn IDE, enter ./bin/tictactoe into command line to run this program.

class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] # array designating empty spaces
  end

  WIN_COMBINATIONS = [  # array of possible win combinations
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  def display_board   # draws the display board, plugging in board arr elements.
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player) # places an x or y on the board
    @board[position.to_i - 1] = current_player
  end

  def position_taken?(position) # checks whether a space is already taken
    if
      @board[position.to_i] == "X" || @board[position.to_i] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(position) # checks whether space is empty, and whether the number entered is 1 - 9
      !position_taken?(position.to_i - 1) && position.to_i.between?(1,9)
  end



  def turn
    puts "Please enter 1-9:" # prints instrux at beginning of turn
    position = gets.strip
      if !valid_move?(position) # if the move isn't valid, start over.
      turn
      else
        move(position, current_player) # else if move is valid, call move function.
        display_board # display updated board
      end
  end

  def turn_count  # checks how many turns have taken place by counting all marked spaces on board.
    number_of_turns = 0
    @board.each do |turns|
      if turns == "X" || turns == "O"
      number_of_turns += 1
      end
    end
    return number_of_turns
  end

  def current_player # determines who the current player is by looking at total turn count.
    if turn_count % 2 == 0 # if turn_count is even, player is X
      current_player = "X"
    else
      current_player = "O" # if turn_count is odd, player is O
    end
  end

  def won?
        if WIN_COMBINATIONS.each do |win_combination| # for each element in WIN_COMBINATIONS

          position_1 = @board[win_combination[0]] # set position_1 to WIN_COMBINATIONS[i][0]
          position_2 = @board[win_combination[1]] # set position_2 to WIN_COMBINATIONS[i][1]
          position_3 = @board[win_combination[2]] # set position_3 to WIN_COMBINATIONS[i][2]

          if
            position_1 == "X" && position_2 == "X" && position_3 == "X" # if Xs occupy positions
            return win_combination # return the win_combination (WIN_COMBINATIONS[i])
          elsif
            position_1 == "O" && position_2 == "O" && position_3 == "O" # same check for Os.
            return win_combination
          end
        end
      else # else if there is no winning combo, return false.
          return false
        end
    end

    def full?  # Checks if all the elements in board are filled with either Xs or Os
      @board.all? do |play|
        play == "X" || play == "O"
      end
    end

    def draw? # if won? returns false and full? returns true, then it's a draw.
      if !won? && full?
        return true
      else
        return false
      end
    end

    def over? # if the full? won? or draw? return true, this returns true
      full? || won? || draw?
    end

    def winner # determines who the winner is
        if won?  # if won? returns true then win_combination is the winning combo retuned from won? function.
          win_combination = won?
          return @board[win_combination[0]] # return  board element (X or O) at first index of the winning combo.
      end
    end

 # above are helper functions. this is the main function below

    def play
      until over? # until the over? function returns true, call turn
        turn
      end
      if won? # if over? returns true, check if won? returns true. if so, congratulate winner (string interp)
        puts "Congratulations #{winner}!"
      elsif draw? # if no one won, check if it's a draw. if so, return "cat's game"
        puts "Cats Game!"
      end
    end
end
