class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

  WIN_COMBINATIONS = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8], #^across
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8], #^down
                    [0, 4, 8],
                    [2, 4, 6] #^diagonal
                     ]



 def input_to_index(input)
   index = (input.to_i - 1)
 end

 def move(index, marker)
  @board[index] = marker
 end

 def position_taken?(index)
 if @board[index] == "" || @board[index] == " " || @board[index] == nil
   false
 else
   true
 end
end

 def valid_move?(index)
  if index.to_i.between?(0, @board.length) && !position_taken?(index)
    true
  end
end

def turn
 puts "Please enter 1-9:"
 input = gets.chomp
 index = input_to_index(input)
 if valid_move?(index) == true
    move(index, current_player)
    display_board
 else
  puts "Invalid number, try again:"
  turn
 end
end

def turn_count
  counter = 0
  @board.each { |xo| counter += 1 if xo == "X" || xo == "O" }
  counter
end

 def current_player
  turn_count.even? ? "X" : "O"
end

 def won?
  WIN_COMBINATIONS.detect do |combo|
    arr1 = combo[0]
    arr2 = combo[1]
    arr3 = combo[2]
        if ((@board[arr1] == "X") && (@board[arr2] == "X") && (@board[arr3] == "X")) || ((@board[arr1] == "O") && (@board[arr2] == "O") && (@board[arr3] == "O"))
         combo
        end
   end
end

 def full?
  @board.all? { |x_o| x_o == "X" || x_o == "O"}
end

 def draw?
  !won? && full?
end

 def over?
  won? || draw? || full?
end

 def winner
  if won? != nil
     won_array = won?
     return @board[won_array[0]]
  end
end


 def play
  until over?
     turn
  end
   if winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
