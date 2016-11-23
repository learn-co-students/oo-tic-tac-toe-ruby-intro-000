class TicTacToe
   def initialize
      @board = Array.new(9, " ")
   end

   WIN_COMBINATIONS = [
      [0, 1, 2], #top row
      [3, 4, 5], #middle row
      [6, 7, 8], #bottom row
      [0, 3, 6], #left column
      [1, 4, 7], #middle column
      [2, 5, 8], #right column
      [0, 4, 8], #top-left, middle-middle, bottom-right
      [2, 4, 6]  #top-right, middle-middle, bottom-left
   ]

   def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   # def input_to_index(user_input)
   #    user_input = user_input.to_i - 1
   # end

   def move(index, token = "X")
      @board[index] = token
   end

   def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
         return false
      end

      if @board[index] == "X" || @board[index] == "O"
         true
      end

      # !(@board[index].nil? || @board[index] == " ")
   end

   def valid_move?(index)
      if index.between?(0, 8) && !position_taken?(index)
         return true
      else
         return false
      end
   end

   def turn
      puts "Please enter 1-9:"

      user_input = gets.strip
      index = user_input.to_i - 1

      if !valid_move?(index)
         turn
      end
      move(index, current_player)
      display_board
   end

   def turn_count
      counter = 0

      @board.each do |n|
         if n == "X" || n == "O"
            counter += 1
         end
      end

      counter
   end

   def current_player
      if turn_count % 2 == 0
         return "X"
      end

      if turn_count % 2 == 1
         return "O"
      end
   end

   def won?
      WIN_COMBINATIONS.each do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]

         position_1 = @board[win_index_1]
         position_2 = @board[win_index_2]
         position_3 = @board[win_index_3]

         if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
         else
            false
         end
      end
      false
   end

   def full?
      @board.all? {|token| token == "X" || token == "O"}
   end

   def draw?
      !(won?) && full?
   end

   def over?
      won? || draw?
   end

   def winner
      if won?
         won_board = won?
         x = won_board[0]
         @board[x]
      end
   end

   def play
      until over?
         turn
      end

      if won?
         puts "Congratulations #{winner}!"
      end

      if draw?
         puts "Cats Game!"
      end
   end

end
