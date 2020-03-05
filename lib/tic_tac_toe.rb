require 'pry'

class TicTacToe
    
    def initialize #  assigns an instance variable @board to an array with 9 blank spaces " "
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
    end
    
    WIN_COMBINATIONS = [ # defines a constant WIN_COMBINATIONS with arrays for each win combination
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[6,4,2]
    ]

    # def board=(board)
    #   @board = board
    # end

    # def board
    #   @board
    # end

    # board = [ " ", " ", " ", " ", " ", " ", " ", " ", " ",]
    
    def display_board # prints arbitrary arrangements of the board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input) # accepts the user's input (a string) as an argument
        #converts the user's input (a string) into an integer
        #converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)
        user_input.to_i - 1
    end

    def move(index, current_player) # allows "X" player in the top left and "O" in the middle
        @board[index] = current_player
    end

    def position_taken?(index) # returns true/false based on whether 
        #the position on the board is already occupied
        @board[index] != " "
    end
    
    def valid_move?(index) # returns true/false based on whether the position is already occupied
        #checks that the attempted move is within the bounds of the game board
        !position_taken?(index) && index.between?(0, 8) # why? no board
    end

    def turn_count # counts occupied positions
        @board.count {|value| value == "X" || value == "O" }
    end

    def current_player # returns the correct player, X, for the third move
        #returns the correct player, O, for the fourth move
        turn_count.even? ? "X" : "O"
    end
    
    def turn  #receives user input via the gets method
        #calls #input_to_index, #valid_move?, and #current_player
        #makes valid moves and displays the board
        #asks for input again after a failed validation
        puts "Please enter 1-9:" 
        input = gets.strip 
        index = input_to_index(input) 
        if valid_move?( index) 
            move(index,current_player) 
        else
            turn
        end
        display_board
    end
    
    def won? #  returns false for a draw
        WIN_COMBINATIONS.any? do |e|
        if position_taken?(e[0]) && @board[e[0]] == @board[e[1]] && @board[e[1]] == @board [e[2]]
        return e
        end
    end
    end
    #binding.pry
    
        
    def full? # returns true for a draw
        #returns false for an in-progress game
        @board.all? { |e| e == "X" || e == "O"}
    end 
    
    def draw? # returns true for a draw
        #returns false for a won game
        #returns false for an in-progres
        full? && !won? 
    end
    
    def over? # returns true for a draw
        #returns true for a won game
        #returns false for an in-progress game
        won? || draw?
    end
    
    def winner
        if e = won?
            @board[e[0]]
        end    
    end 
    
    def play
        turn until over? 
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end