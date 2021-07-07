class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  #bottom row
    [0,3,6],  #left column
    [1,4,7],  #middle column
    [2,5,8],  #right column
    [0,4,8],  #diagnocal left
    [2,4,6]   #diagonal right
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player = "X")
    @board[input.to_i - 1] = current_player
  end

  def position_taken?(location)
    @board[location.to_i] != " " && @board[location] != ""
  end

  def valid_move?(location)
    (location.to_i).between?(1,9) && !position_taken?(location.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end
  def turn_count
    counter=0
    @board.each do |space|
      if space == "X"
        counter += 1
      elsif space == "O"
        counter += 1
      end
    end
    return counter
  end
  def current_player
    if turn_count%2==0
      return "X"
    else
      return "O"
    end
  end
  def won?
    WIN_COMBINATIONS.find do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
  @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] && @board[win_index_1] != " "

    end
  end
  def full?
    (0..8).all? do |space|
      position_taken?(space)
    end
  end

  def draw?
    if won? != nil
      return false
    elsif full? == false
      return false
    else return true
    end
  end
  def over?
    if won? != nil
      return true
    elsif draw? == true
      return true
    else return false
    end
  end

  def winner
  if won? != nil
    win_move = won?
    @board[win_move[0]]
  else return nil
  end
  end

  def play
    until over?
      turn
    end
  if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
