class TicTacToe

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

  #WIN_COMBINATIONS
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  #input_to_index
  def input_to_index(input)
    input.to_i - 1
  end

  #move
  def move(input, current_player)
    index = input_to_index(input)
    @board[index] = current_player
  end

  #position_taken?
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  #valid_move?
  def valid_move? (input)
    index = input_to_index(input)
    !position_taken?(index) && index.between?(0,8)
  end

  #won?
  def won?
    WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    end
  end
      return false
  end

  #full?
  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end

  #draw?
  def draw?
    !won? && full?
  end

  #over?
  def over?
    won? || draw?
  end

  #winner
  def winner
    if won?
    @board[won?[0]]
  end

  end

  #turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  #play
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
