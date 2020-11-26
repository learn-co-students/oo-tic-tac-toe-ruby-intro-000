class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

      def turn_count
        @board.count{|token| token == "X" || token == "O"}
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

      def move(index, player_token)
        @board[index] = player_token
      end

      def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
      end

      def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          turn
        end
end

        def play
          counter = 0
          until counter == 9
            turn
            counter += 1
          end
        end

        def play
          until over?
            turn
        end
        if won?
          @winner = winner
          puts "Congratulations #{@winner}!"

        elsif draw?
              puts "Cat's Game!"
        end

        end


        def position_taken?(index)
          !(@board[index].nil? || @board[index] == " ")
        end

        # Define your WIN_COMBINATIONS constant
        WIN_COMBINATIONS = [
          [0,1,2], #top row
          [3,4,5], #middle row
          [6,7,8], #bottom row
          [0,3,6], #left column
          [1,4,7], #middle column
          [2,5,8], # right column
          [0,4,8], #left diagonals
          [2,4,6] #right column
        ]

        def won?
          WIN_COMBINATIONS. each do |win_combination|
            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]

            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]


            if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_2)
              return win_combination
          end
        end
              return false
            end

          def full?
           @board.all? {|space| space == "X" || space == "O"}
        end


        def draw?
           if !full? && !won?
             return false
           elsif !won? && full?
               return true
           else won?
             return false
           end
        end


        def over?
          if full? or won? or draw?
            return true
          end
        end

        def winner
          if win_combination = won?
    return @board[win_combination.first]

end
end

end
