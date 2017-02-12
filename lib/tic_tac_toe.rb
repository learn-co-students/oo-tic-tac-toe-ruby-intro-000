class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
  if @board[index] == nil || @board[index] == "" || @board[index] == " "
    return false
  else
    return true
  end
  end

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
    move(index, current_player)
    display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
    return win_combo  if position_taken?(win_combo[0]) &&
                         @board[win_combo[0]] == @board[win_combo[1]] &&
                         @board[win_combo[1]] == @board[win_combo[2]]
  end
    return false
  end

  def full?
    @board.each do |element|
    return false if element == "" || element == " " || element == nil
  end
    return true
  end

  def draw?
    if won? || !full?
      false
    else
      true
    end
  end

  def over?
     won? || draw? || full?
   end

  def winner
    if won?
      win_person = won?
      return @board[win_person[0]]
    end
    return nil
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
