class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    return index.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] != " "
      return true
    end
    return false
  end

  def valid_move?(index)
    if position_taken?(index) == false && (index >= 0 && index <= 8)
      return true
    end
    return false
  end

  def turn_count
    @count = 0
    @board.each do |value|
      if value != " "
        @count += 1
      end
    end
    return @count
  end

  def current_player
    if turn_count() % 2 == 0
      return "X"
    end
    return "O"
  end

  def turn
    puts "Choose a position: "
    position = gets.strip
    index = input_to_index(position)

    if valid_move?(index) == true
      move(index, current_player())
    end

    display_board()
  end

  # won method : returns true if there is a winner; else if not
  def won?()

      # loops through the 2D array WIN_COMBINATIONS
      WIN_COMBINATIONS.each do |combination|

        # flags
        x_win = 0
        o_win = 0

        combination.each do |index|

          # checks if player X wins
          if @board[index] == "X"
            x_win += 1

            if x_win == 3
              return combination
            end
          else
            x_win = 0
          end

          # checks if player O wins
          if @board[index] == "O"
            o_win += 1

            if o_win == 3
              return combination
            end
          else
            o_win = 0
          end

        end
      end

      # return false if there is no winner
      return false
  end

  # full method : accepts the array "board" and returns true if every element in the board contains a value "X" or "O"
  def full?()
    @board.each do |values|
      if values == " " || values == ""
        return false
      end
    end
    return true
  end

  # draw method : accepts the array "board" and returns true if the board has not been won but is full
  def draw?()
    if full?() && !won?()
      return true
    end
    return false
  end

  # over method : accepts the array "board" and returns true if board has been won, is a draw, or is full
  def over?()
    if won?() || draw?()
      return true
    end
    return false
  end

  # won method" accepts board and returns the token "X" or "O" indicating the winner
  def winner()
    if won?()
      return @board[won?()[0]]
    end
    return nil
  end

  # Define play method : The play method is the main method of the tic tac toe application and is responsible for the game loop.
  # A tic tac toe game must allow players to take turns, checking if the game is over after every turn, and at the conclusion of the game,
  # whether because it was won or because it was a draw, reporting to the user the outcome of the game.
  def play()
    until over?() == true
      turn()
    end
    if draw?() != true
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
