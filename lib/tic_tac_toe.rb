require "pry"
class TicTacToe
  
  attr_accessor(:board,:win_combinations)
 def initialize(board = [" "," "," "," "," "," "," "," "," "])
  
   @board = board
 
 end
WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
 def win_combinations(win_combinations)
    return win_combinations.size  
 end

   
   
  def display_board
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 
 def input_to_index(int)
 user_input = int.to_i 
 index = user_input - 1
 return index
 end
  def move(index,token = "X")
    board[index] = token
    
  end
  def position_taken?(index)
    if board[index] == " "
      return false 
    else 
      return true
    end
  end
  def  valid_move?(index)
    if board[index] == " "
      if  index >= 0 && index <= 8
      return true 
    else
     return false 
end
else 
  return false
end
end



 def  turn_count 
@board = initialize(board)
#binding.pry
  count = 0
   @board.each do |turn|
    if turn == "X" || turn == "O"
   
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
    puts "please choose your position between 1-9"
    input = gets.chomp
    index=input_to_index(input)
    if valid_move?(index) == true
       current_player
       move(index)
       @board = board
       display_board = @board
       return  display_board
    else
     puts "please choose your position between 1-9"
    input = gets.chomp
    index=input_to_index(input)
      if valid_move?(index) == true
      current_player
       move(index)
       @board = board
       display_board = @board
       return  display_board
     else
       turn
       end 
     
       
     end

    end  
   #  puts "please choose a position between 1-9"
    #input  = gets.chomp
   # index = input_to_index(input)
   # @board = initialize(board)
    
  # @board[index] = move(index,current_player)
   
  
    

       
     

     



def won?
 if board.none?{|i| i != " "}
 return false
 end
  
  
  if board[0] == "X" && board[1]== "X" && board[2]== "X"
    return    WIN_COMBINATIONS[0]
   elsif board[3] == "X" && board[4] == "X" && board[5]== "X"
    return  WIN_COMBINATIONS[1]
   elsif board[6] == "X" && board[7] == "X" && board[8]== "X"
     return  WIN_COMBINATIONS[2]
   elsif board[0] == "O" && board[3] == "O" && board[6]== "O" 
     return  WIN_COMBINATIONS[3]
   elsif board[1] == "O" && board[4] == "O" && board[7]== "O" 
     return WIN_COMBINATIONS[4]
   elsif board[2] == "O" && board[5] == "O" && board[8]== "O" 
     return WIN_COMBINATIONS[5]
   elsif board[0] == "X" && board[4] == "X" && board[8]== "X" 
     return WIN_COMBINATIONS[6]
    elsif board[6] == "O" && board[4] == "O" && board[2]== "O"  
     return WIN_COMBINATIONS[7]
  end
end
def full?
  if board.all?{|i| i!=" "} 
    return true
  else
    return false
 end
 end
 def draw?
  if full? == true  && won? == false
    return true
  else
    return false
  end
  
end
def over?
  if board.any?{|i| i == " "} 
    return false
  end
 if won? != false || draw? == true 
     return true
   else  
    return false
   end

  
end
def winner 
  if won? != false
    if won? == WIN_COMBINATIONS[6]
      
   return "X"
 elsif won? == WIN_COMBINATIONS[4] 
   return "O"
   end
 else
   nil
  end
end

def play
  
      turn
      #binding.pry
   if over? == true
      if winner == "X"
        puts "congratulate X the winner"
      elsif winner == "O"
        puts "congratulate O the winner"
      elsif draw? == true
       puts  "Cat\'s Game!"
     end
   else 
     
    while over? == false
        turn
      end
    end  
end
end