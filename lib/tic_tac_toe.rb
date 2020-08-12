class TicTacToe
  def initialize
    @board = [" "]*9
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
    x = *(0..8)
    puts" #{@board[x.shift]} | #{@board[x.shift]} | #{@board[x.shift]} "
    puts "-----------"
    puts" #{@board[x.shift]} | #{@board[x.shift]} | #{@board[x.shift]} "
    puts "-----------"
    puts" #{@board[x.shift]} | #{@board[x.shift]} | #{@board[x.shift]} "
  end

  def input_to_index(input)
    # take input, convert to integer and subtract 1
    i = input.to_i
    index = i - 1
  end

  def move(index, token)
    # index in the board array that the player would like to fill out with an "X" or an "O"
    # the player's character (either "X" or "O")
    m = @board
    m[index] = token
    @board = m
  end

  def position_taken?(index)
    # method will check to see if that board index is vacant or if it contains an "X" or an "O"
    # If the position is free, the method should return false (i.e. "not taken")
    @board[index] != " " && !@board[index].nil?
  end

  def valid_move?(index)
    # returns true if the move is valid and false or nil if not
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    # encapsulate the logic of a single complete turn
    player = current_player()
    puts "#{player}'s turn. Please enter a number from 1-9."
    i = gets.chomp.to_i
    i = input_to_index(i)
    while !valid_move?(i)
      puts "Try again. Please enter a number from 1-9"
      i = gets.to_i
    end
    move(i, player)
    display_board()
  end

  def turn_count
    # returns the number of turns that have been played.
    x = []
    @board.select do |c|
      c != " " && !c.nil? ? x << c : a=a
    end
    x.length()
  end

  def current_player
    # use the #turn_count method to determine if it is "X"'s turn or "O"'s
    c = turn_count() % 2
    if c == 0
      current_player = "X"
    else
      current_player = "O"
    end

  end

  def won?
    b = @board
    WIN_COMBINATIONS.detect{|c| b[c[0]] != " " && b[c[0]] == b[c[1]] && b[c[0]] == b[c[2]]}
    # should be able to iterate over the combinations defined in WIN_COMBINATIONS
    # using each or a higher-level iterator
    # return the correct board indexes that created the win
  end

  def full?
    # should accept a board and return true if every element in the board contains either an "X" or an "O".
    # return false if there is an available position and true if there is not
    @board.none?{|p| p == " "}
  end

  def draw?
    # returns true if the board has not been won but is full
    # false if the board is not won and the board is not ful
    # false if the board is won
    # compose this method solely using the methods you used above with some ruby logi
    full?() && !(won?())
  end

  def over?
    # returns true if the board has been won, is a draw, or is full
    # compose this method solely using the methods you used above with some ruby logic
    full?() || draw?() || won?()
  end

  def winner
    p = won?()
    if p == nil
      nil
    else
      winner = @board[p[0]]
    end
  end

  def play
    # the main method of the tic tac toe application and is responsible for the game loop
    # must allow players to take turns
    # checking if the game is over after every turn
    # at the conclusion of the game, reporting to the user the outcome of the game
    #board = [" "] * 9
    until over?()
      turn()
    end
    if won?()
      w = winner()
      puts "Congratulations #{w}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end


  #
  #
  #
  #
end
