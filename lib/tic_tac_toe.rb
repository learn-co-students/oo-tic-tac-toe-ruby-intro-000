class TicTacToe

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts "-----------"
    end

    def input_to_index(input)
        @index = input.to_i - 1
    end

    def move(input, token = "X")
        @board[input_to_index(input) + 1] = token
    end

    def position_taken?(index)
        if (@board[index] == "X" || @board[index] == "O")
            return true
        else
            return false
        end
    end

    def valid_move?(position)
        if position > 8 || position < 0
            return false
        elsif position_taken?(position)
            return false
        else
            return true
        end
    end

    def turn_count
        count = 0

        @board.each do |cell|
            if (cell == "X" || cell == "O")
                count += 1
            end
        end

        count 
    end

    def turn
        player_move = input_to_index(gets.strip)

        if valid_move?(player_move)
            token = current_player
            @board[player_move] = token
            display_board
        else
            turn
        end

    end

    def current_player
        return "X" if turn_count%2 == 0
        return "O"
    end

    def won?
        xs = []
        os = []

        @board.each_with_index do |cell, i|
            xs.push(i) if cell == "X"
            os.push(i) if cell == "O"
        end

        if xs.length >= 3
            WIN_COMBINATIONS.each do |comb|
                return comb if (xs - comb).length == xs.length - 3
            end
        end

        if os.length >= 3
            WIN_COMBINATIONS.each do |comb|
                return comb if (os - comb).length == os.length - 3
            end
        end

        return false
        
    end

    def full?
        count = 0
        @board.each do |cell|
            count += 1 if cell == "X" || cell == "O"
        end
        
        return true if count == 9

    end

    def draw?
        return true if full? && !won?
        false
    end

    def over?
        return true if full? || won?
    end

    def winner

        xs = []
        os = []

        @board.each_with_index do |cell, i|
            xs.push(i) if cell == "X"
            os.push(i) if cell == "O"
        end

        
        WIN_COMBINATIONS.each do |comb|
            return "X" if (xs - comb).length == xs.length - 3
            return "O" if (os - comb).length == os.length - 3
        end

        return nil

    end

    def play

        while !over? do
            turn

            if draw?
                puts "Cat's Game!"
                return
            end
        
        end

        if draw?
            puts "Cat's Game!"
        end
        
        if won?
            puts "Congratulations #{winner}!"
        end
        
    end

end


