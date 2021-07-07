class TicTacToe
  
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  
  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5], 
    [6, 7, 8], 
    
    [0, 3, 6], 
    [1, 4, 7],
    [2, 5, 8],
    
    [0, 4, 8], 
    [2, 4, 6] 
  ]
  
  
# Define your display_board here
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

# Define your input_to_index here
def input_to_index(user_input)
  user_input.to_i - 1
end

# Define your current_player here
def move(index, current_player)
  @board[index] = current_player
end

# Define your position_taken? here
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your valid_move? here
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end



# Define your turn_count here
def turn_count
  counter = 0
  @board.each do|element|
    if (element == "X") || (element == "O")
      counter += 1 
    end
  end
  return counter
end


# Define your current_player here
def current_player
  (turn_count % 2 == 0)? "X" : "O"
end


def turn
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
 
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn
  end
end

# Define your won? here
def won?

     board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |element| 
        if @board[element[0]] == "X" && @board[element[1]] == "X" && @board[element[2]] == "X" || @board[element[0]] == "O" && @board[element[1]] == "O" && @board[element[2]] == "O"
          return element
        end
      end
      return false
  end
end


def full?

  @board.each do |element|
    if (element == " ") 
      return false
    end
  end
  return true
end

def draw?
   won? == false && full? == true
end


def over?
    won? || draw? || full? ? true : false
  end


def winner 
    WIN_COMBINATIONS.detect do |element| 
          if @board[element[0]] == "X" && @board[element[1]] == "X" && @board[element[2]] == "X" 
            return "X"
          elsif @board[element[0]] == "O" && @board[element[1]] == "O" && @board[element[2]] == "O"
            return "O"
          else 
            nil
          end
    end
  end
  
  
def play 
  while over? == false
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end

end
 


   
