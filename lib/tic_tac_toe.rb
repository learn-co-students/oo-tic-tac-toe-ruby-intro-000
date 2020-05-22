require 'pry'

class TicTacToe

    def initialize
        board = Array.new(9, " ")
        @board = board


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
        puts "-------------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-------------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end

    def turn_count
        @board.count { |occupied| occupied == "X" || occupied == "O"}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Enter an empty board spot, 1-9"
        input = gets.strip
        index = input_to_index(input)

        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            return turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |trio|

            if [@board[trio[0]], @board[trio[1]], @board[trio[2]]] == ["X", "X", "X"] || [@board[trio[0]], @board[trio[1]], @board[trio[2]]] == ["O", "O", "O"]
            return trio
            end
        end

        false
    end

    def full?
        @board.all? do |occupied|
            occupied == "X" || occupied == "O"
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            @board[won?[0]]
        end
    end

    def play
        puts "Welcome to a rousing game of Tic Tac Toe!"
        
        until over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end

    end


end




