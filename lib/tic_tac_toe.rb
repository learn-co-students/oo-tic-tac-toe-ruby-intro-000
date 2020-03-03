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
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
    if valid_move?(index)
       
       move(index,current_player)
      
       display_board 
       
    else
    
       turn
     
     
     end

    end  
   

def won?
 if board.none?{|i| i != " "}
 return false
 end
  WIN_COMBINATIONS.each do |i| 
    first = i[0]
    secound = i[1]
    third = i[2]
    if board[first] == "X" && board[secound]== "X" && board[third]== "X"
    return    i
  elsif
     board[first] == "O" && board[secound]== "O" && board[third]== "O"
     return i
  end
end
  

  return false
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
  
 if won? != false || draw? == true 
     return true
   else  
    return false
   end

  
end
def winner 
  if won? != false
 return board[won?[1]] 
 end
end
def play
 # binding.pry
  while over? == false
        turn
      end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
     else 
       puts  "Cat's Game!"
     end
   
  end

end