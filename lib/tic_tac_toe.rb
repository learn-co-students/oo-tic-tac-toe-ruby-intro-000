class TicTacToe
    def initialize(board = nil)
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
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        def update_array(array, index, token)
          array[index] = token
        end
        update_array(@board, index, token)
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end
    
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.chomp
        index = input_to_index(input)
        token = current_player
          if valid_move?(index)
             move(index, token)
          else
              turn
          end
        display_board
    end

    def won?
        WIN_COMBINATIONS.detect do |index|
          @board[index[0]] == @board[index[1]] &&
          @board[index[1]] == @board[index[2]] &&
          position_taken?(index[0])
        end
    end

    def full?
        @board.none?{|tolken| tolken == "" || tolken == " "}
    end

    def draw?
        !won? && full?    
    end

    def over?
        won? || draw?
    end

    def winner
        if winning_player = won?
          @board[winning_player.first]
        end
    end

    def play
        until over?
          turn
          display_board
        end
      
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end
end
