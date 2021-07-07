class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
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

  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Take user input and convert to Integer
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Display user input as a move
  def move(user_input, character = "X")
   @board[user_input] = character
  end

  # Evaluate position selected is occupied
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # accepts board and returns true if move is valid
  def valid_move?(index)
    if position_taken?(index)
      false
    elsif position_taken?(index) == false && index.between?(0,8)
      true
    end
  end

  # turn asks user for input, convets to index, makes move if valid
  #turn method
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
  #    puts "Invalid move"
      turn
    end
  end

  # method takes in an argument of the board array and returns the number of turns that have been played.
  def turn_count
    turn = @board.reject {|position| position == " "}
    turn.size
  end

  #method should take in an argument of the game board and use the #turn_count method to determine if it is "X"'s turn or "O"'s.
  def current_player
    x_moves = @board.select {|position| position == "X"}
    o_moves = @board.select {|position| position == "O"}

    if x_moves.size == o_moves.size
      character = "X"
    else
      character = "O"
    end
  end

  # accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win.
  def won?

    WIN_COMBINATIONS.find do |win_combination|
    #  puts "This is win combination #{win_combination}"
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
    end
  end

  def full?
    if @board.include?(" ") == false
      true
    end
  end

  # that accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won.
  def draw?
    if won? == nil && full? == true
      true
    else
      false
    end
  end

  # that accepts a board and returns true if the board has been won, is a draw, or is full.
  def over?
    #require 'pry'
    #binding.pry
    if won? || draw?
      true
    end
  end

  # accept a board and return the token, "X" or "O" that has won the game given a winning board.
  def winner
    if won? == nil
      return nil
    else
      winning_position = won?
      winning_index = winning_position[0]
      @board[winning_index]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
      #  elsif over?(board) == false
      #   turn(board)


    end
  end

end