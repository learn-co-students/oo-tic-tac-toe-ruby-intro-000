 class TicTacToe
   WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]
   
  def initialize
    @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
end



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
 
 def move(index, char="X")
@board[index]=char
end

def position_taken? ( index)
  if @board[index] == "" || @board[index] == " " || @board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?( index)
  if !position_taken?( index) && index.between?(0,8)
    return true
  else 
    return false
  end
end

def turn
   puts "Please enter 1-9:"
user_input = gets.strip
index= input_to_index(user_input)
 if valid_move?(index)
 move(index, current_player)
display_board
else turn
end
end


def turn_count
  count=0
 @board.each do |index| 
   if index=="X" ||index== "O"
   count+=1
end
end
count
end

def current_player
  if turn_count%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

 
   
def won?
 
  
  WIN_COMBINATIONS.each do|win_combination|
  win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   
   position_1 = @board[win_index_1] 
   position_2 = @board[win_index_2] 
   position_3 = @board[win_index_3] 
  
 if position_1==position_2&&position_2== position_3&&position_taken?(win_index_1)
   return win_combination
  
  end
end
return false
end 
      
def full?
  if @board.all? do |i| 
  i == "X" || i == "O"
end
  return true 
else
 return false
end
end


def  draw? 
  if !won?&&full?
    return true
  elsif won?
    return false
  else 
    return false
  end
end

def over?
 if won?||draw?||full? 
   return true
 else return false
 end
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
       
      puts "Congratulations #{winner}!" 
   elsif draw?
      puts "Cat's Game!" 
   end 
end
end


 

  
 