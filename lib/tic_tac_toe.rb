class TicTacToe 
    def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
    end 
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], 
  [6,7,8],
  [0,3,6], # 1st column
  [1,4,7],
  [2,5,8],
  [0,4,8], # 1st diagonal
  [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, character)
    @board[index] = character 
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player
  if valid_move?(index)
    move(index, character)
    display_board
  else
    turn
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_0 = win_combination[0]
      win_index_1 = win_combination[1]
      win_index_2 = win_combination[2]
      
      position_1 = @board[win_index_0]
      position_2 = @board[win_index_1]
      position_3 = @board[win_index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3  == "O"
        return win_combination
      end
    end
    return false 
  end
end 

   def full?
    @board.all?{|elem| elem == "X" || elem == "O" }
  end
  
  def draw?
    if full? && !won?
      return true 
    elsif won?
    return false 
   end
  end
 
  def over?
   if won? || full? || draw?
     return true 
   else 
     false 
   end 
  end
  
   def winner
   WIN_COMBINATIONS.each do |win_combination|
      win_index_0 = win_combination[0]
      win_index_1 = win_combination[1]
      win_index_2 = win_combination[2]
      
      position_1 = @board[win_index_0]
      position_2 = @board[win_index_1]
      position_3 = @board[win_index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
        elsif position_1 == "O" && position_2 == "O" && position_3  == "O"
        return "O"
      end
    end
    return nil  
  end
  
  def play
  until over?
      turn
    end
      if won?
       puts "Congratulations #{winner}!"
       elsif draw?
       puts "Cat's Game!"
    end 
  end 
end