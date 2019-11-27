class TicTacToe
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]

    def initialize
        @board = Array.new(9, " ")
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
    
    def position_taken?(index)
        @board[index] != " "
    end
    
    def valid_move?(index)
        return true if (index.between?(0, 8) && !position_taken?(index))
    end
    
    def move(index, token="X")
        @board[index] = token
    end
    
    def turn_count   
        turns_played = 0
        @board.map do |element|
            turns_played += 1 if (element == "X" || element == "O")
        end
        turns_played 
    end
    
    def current_player
        if (turn_count % 2 == 0)
            return "X"
        else 
            return "O"
        end
    end
    
    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if (valid_move?(index))
            move(index, current_player)
            display_board
        else
            turn
        end
    end
    
    def won?
        WIN_COMBINATIONS.each do | combination |
            win_index_1 = combination[0]
            win_index_2 = combination[1]
            win_index_3 = combination[2]
            
            position_1 = @board[win_index_1] 
            position_2 = @board[win_index_2] 
            position_3 = @board[win_index_3] 
            
            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return combination 
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return combination
            end
        end
        return false
    end
    
    def full?
        @board.all? do | element |
          element == "X" || element == "O"
        end
    end
      
    def draw?
        return true if full? && !won?
    end
      
    def over?
        return true if won? || full? || draw?
    end
      
    def winner
        if (won?)
            winning_combination = won?
            position_1 = @board[winning_combination[0]] 
            if (position_1 == "X")
                return "X"
            elsif (position_1 == "O")
                return "O"
            else 
                return nil
            end
        end
    end
    
    def play
        until over?
            turn
        end
        if (won?)
            puts "Congratulations #{winner}!"
        elsif (draw?)
            puts "Cat's Game!"
        end
    end 
end