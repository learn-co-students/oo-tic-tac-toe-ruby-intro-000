class TicTacToe

  # Initialize an empty nine position array for the board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # WIN_COMBINATIONS constant
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

  # Display the board based on the current @board array
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Places an X or O on the board
  def move(user_input, value="X")
    index = user_input.to_i - 1
    @board[index] = value
  end

  # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Determines if the user input is valid for a move
  def valid_move?(user_input)
    index = user_input.to_i - 1
    if index >= 0 && index <= 8
      if position_taken?(index)
        return false
      else
        return true
      end
    else
      return false
    end
  end

  # Counts the number of turns
  def turn_count
    count = 0
    @board.each do |square|
      if square == "X" || square == "O"
        count += 1
      end
    end
    return count
  end

  # Determines whether it's X or O player based on turn count
  def current_player
    player = turn_count.even? ? "X" : "O"
    return player
  end

  # Turn loop
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(user_input) == true
      value = current_player
      move(user_input, value)
      display_board
    else
      puts "invalid."
      turn
    end
  end

  # Winning Move?
  def won?
    WIN_COMBINATIONS.each do |combination|
      #pull values from board corresponding to winning combination
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]
      #check for a winner
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination
      end
    end
    return false
  end

  def full?
    full = !(@board.any? { |position| position == " " || nil })
    return full
  end

  def draw?
    if !(won?)
      return full?
    end
  end

  def over?
    over = full? || won? || draw?
    return over
  end

  def winner
    win_combo = won?
    if win_combo == false
      return nil
    else
      return @board[win_combo[0]]
    end
  end

  # Playing the Game
  def play
    while !(over?)
      turn
    end
    if won?
      winner_name = winner
      puts "Congratulations #{winner_name}!"
    else
      puts "Cats Game!"
    end
  end
end
