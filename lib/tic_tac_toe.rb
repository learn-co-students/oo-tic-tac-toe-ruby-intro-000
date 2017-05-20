class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
  	[6,7,8],
  	[3,4,5],
  	[0,3,6],
  	[2,5,8],
  	[1,4,7],
  	[0,4,8],
  	[2,4,6]
  ]
  def initialize(board=Array.new(9," "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(user_input, char) #char = "X"
    @board[user_input] = char
  end

  def position_taken?(index)
    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      false
    elsif (@board[index] == "X") || (@board[index] == "O")
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8)
      if !position_taken?(index)
        true
      end
    end
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i == "X" || i == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    	display_board
    else
      turn
    end
  end

  def full?
  	   if @board.select {|item| item == " "} != []
  	       return false
  	   else
  	       return true
  	   end
  end

  def draw?
  		!won? && full?
  end

  def won?
      WIN_COMBINATIONS.each do | wins |
          if ((@board[wins[0]] == "X" && @board[wins[1]] == "X" && @board[wins[2]] == "X") ||
             (@board[wins[0]] == "O" && @board[wins[1]] == "O" && @board[wins[2]] == "O"))
             winner_val = @board[wins[0]]
          return wins
          else
              false
          end
       end
         return false
  end

  def over?
  	won? || draw?
  end

  def winner
    if won? == false
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    elsif @board[won?[0]] == "O"
      return "O"
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
  	end
  end

end
