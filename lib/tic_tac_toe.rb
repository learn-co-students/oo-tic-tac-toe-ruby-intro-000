class TicTacToe

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
    
    def initialize(board = nil)
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def welcome
        puts "Welcome to Tic Tac Toe!"
    end

    def key
        puts "key"
        puts " 1 | 2 | 3"
        puts "-----------"
        puts " 4 | 5 | 6 "
        puts "-----------"
        puts " 7 | 8 | 9 "
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(move)
        index = move.to_i - 1
        index
    end

    def move(index, value = "X")
        @board[index] = value
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        elsif @board[index] == ""
            return false
        elsif @board[index] == nil
            return false
        elsif @board[index] == "X" || @board[index] == "O"
            return true
        end
    end

    def valid_move?(index)
        if position_taken?(index) || !index.between?(0, 8)
            return false
        else
            return true
        end
    end

    def turn
        puts "Please enter 1-9:"
        move = gets.strip
        index = input_to_index(move)
        
        if valid_move?(index)  
            move(index, value = current_player)
            display_board
        else
            turn
        end
    end

    def turn_count
        count = 0
        @board.each do |element|
            if element == "X" || element == "O"
                count += 1
            end
        end
        return count
    end


    def current_player
        if turn_count.even?
            return "X"
        elsif turn_count.odd?
            return "O"
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combination|
          if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
            return win_combination
          elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
            return win_combination
          end   
        end
        return false
    end

    def full?
        @board.none? do |element|
          element == " "     
        end
    end

    def draw?
        if full? && !won?
        return true
        end
    end

    def over?
        if draw? || full? || won?
          return true
        else 
          return false
        end
    end

    def winner
        WIN_COMBINATIONS.each do |win_combination|
          if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
            return "X"
          elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
            return "O"
          end   
        end
        return nil
    end

    def play 
        welcome
        key
       while !over?
        turn
       end 
       if draw?
        puts "Cat's Game!"
       elsif won?
        puts "Congratulations #{winner}!"
       end

    end
      
      

end
