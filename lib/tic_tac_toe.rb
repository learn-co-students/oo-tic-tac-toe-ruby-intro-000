require "pry"
class TicTacToe

       WIN_COMBINATIONS = [
       [0,1,2], # Top row
       [3,4,5], # Middle row
       [6,7,8], # Bottom row
       [0,3,6], # Left column
       [1,4,7], # Middle column
       [2,5,8], # Right column
       [0,4,8], # Top left to bottom right
       [2,4,6]] # Top right to bottom left
#
def initialize
    @board = Array.new(9, " ")
#       # so i understand that @board creates an instance variable that will be filled with an array that get's filled in during the course
#       #of a game of tic tac toe. but why am i saying @board = board? couldn't it just be @board. what is the significance of the board
#       #varibale. i've also been copy and pasting the below methods from the previous tutorials in my github repository. and changing
#       #instance of the board variable in those to @board - i did this in order to pass my tests in this particular tutorial but i don't
#       #understand why i've been replacing the board varibale with @board and in some cases in this code to the index varibale. Please
#       #help me understand that.
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

    def move(index, current_player = "X")
             @board[index] = current_player
    end

    def position_taken?(index)
      @board[index] != " " && @board[index] != ""
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
           puts "Welcome to TicTacToe. Please enter 1-9:"
           display_board
           user_input = gets.strip
           index = input_to_index(user_input)
             if valid_move?(index)
               move(index, current_player)
             else
             turn
           end
         end

     def won?
       WIN_COMBINATIONS.each do |combo|
         if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
           return combo
         end
       end
       return nil
     end

     def full?
       !@board.any? { |space|  space == " " }
     end

     def draw?
       if !won? && full?
         puts "Cat's Game!"
         return true
       end
     end

     def over?
       draw? || won?
     end

     def winner
       #binding.pry
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
   else
     draw?
   end
 end


end
