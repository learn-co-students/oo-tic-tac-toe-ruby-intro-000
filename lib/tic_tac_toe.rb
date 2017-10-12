class TicTacToe

  # Define the initialize method
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

# Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    (1..9).include?(user_input.to_i) ? user_input.to_i - 1 : -1
  end

  def move(pos, token)
    @board[pos] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    position_taken?(index) || !(0..8).include?(index) ? false : true
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    pos = input_to_index(input)
    validation = valid_move?(pos)
    if validation
      # puts "Please enter 1-9:"
      # input = gets.chomp
      # pos = input_to_index(input)
      # validation = valid_move?(@board,pos)
      move(pos,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each{|elm| count += 1 if ["X","O"].include?(elm)}
    count
  end

  def current_player
    (turn_count+1) % 2 == 0 ? "O" : "X"
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end

    # won?(@board) ? "Congratulations #{winner(@board)}!" : "Cat's Game!"
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
