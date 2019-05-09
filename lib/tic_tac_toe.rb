class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      return true
    end
    false
  end

  def valid_move?(position)
    if position.between?(0, 9) && !position_taken?(position)
      return true
    end
    false
  end

  def turn
    puts "Please enter a number between 1 and 9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end

    display_board
  end

  def turn_count
    counter = 0
    @board.each do |play|
      if play == "X" || play == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn = turn_count.even? ? "X" : "O"
  end

  def won?
     WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board[win_index_1] # value of board at win_index_1
       position_2 = @board[win_index_2] # value of board at win_index_2
       position_3 = @board[win_index_3] # value of board at win_index_3

       if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_2)
         return win_combination
       end
     end
     false
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    if !won? && full?
     return true
    end
    false
  end

  def over?
    if draw? || won? || full?
     return true
    end
    false
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
       turn
    end
    if won?
       winner == "X" || winner == "O"
       puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    end
  end
end
