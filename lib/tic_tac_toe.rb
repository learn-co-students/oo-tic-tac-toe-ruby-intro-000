class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5],[6,7,8],[0,3,6],
  [1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]
  def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end
  
  # GENERAL METHODS ############
  
  def display_board
    puts [0,3,6].map {|i| " #{@board[i]} | #{@board[i+1]} | #{@board[i+2]} \n"}.join("#{'-'*11}\n")
  end
  
  # MAIN FUNCTION METHODS #########
  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)  # WHY ARE WE PASSING AROUND LOCAL VARIABLES INSTEAD OF USING @
    if valid_move?(index) 
      char = current_player
      move(index,char) 
      display_board
    else 
      turn
    end
  end
  # END OF MAIN FUNCTION METHODS #########
  
  
  
  # ENDGAME METHODS #########
  def over?
    return draw? || won?
  end
  
  def won? # b short for board
    WIN_COMBINATIONS.find do |win|
      @board[win[0]] == @board[win[1]] &&
      @board[win[1]] == @board[win[2]] && 
      @board[win[0]] != " "
    end
  end
  
  def draw?
    return full? && !won?
  end
  
  def full?
    return @board.none? {|square| square == " "}
  end
  
  def winner #return the piece of the winner 
    return @board[won?[0]] if won? # won returns the winning combo 
  end
  # END OF ENDGAME METHODS #########
  
  
  
  
  # SETUP MOVE METHODS #############################################
  def get_input
    @input = gets.strip
  end

  def input_to_index(str)
    @index = str.to_i - 1
  end
  # END OF SETUP MOVE METHODS #############################################
  


  # MOVE CHECK METHODS ########
  def valid_move?(index)
    return !position_taken?(index) && index.between?(0,8)
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  # END OF MOVE CHECK METHODS ########



# ACTUAL MOVE METHODS #######
  def current_player
    return turn_count.even? ? "X" : "O"
  end

  def turn_count
    return @board.count {|square| square != " "}
  end

  def move(index,player_piece)
    @board[index] = player_piece
  end
end
# THE END