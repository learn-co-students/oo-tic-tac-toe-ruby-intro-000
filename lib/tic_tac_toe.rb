class TicTacToe

	def initialize()
		@board = Array.new(9," ")
	end

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def position_taken?(location)
		@board[location.to_i] != " " && @board[location.to_i] != ""
	end

	def valid_move?(pos)
		pos.to_i.between?(1,9) && !position_taken?(pos.to_i - 1)
	end

	def move(location,currentplayer)
		@board[location.to_i - 1] = currentplayer
	end

	def turn
		puts "Please enter 1-9:"
		input = gets.strip
		if valid_move?(input)
			move(input, current_player)
			display_board
		else
			turn
		end
	end

	def turn_count
		@board.count{|el| el == "X" || el == "O"}
	end

	def current_player
		if turn_count % 2 == 0
			return "X"
		else
			return "O"
		end
	end

	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	def won?
		WIN_COMBINATIONS.detect {|win_combination|
			(@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
		}
	end
#all? returns true if the block never returns false or nil
	def full?
		@board.all? { |e|
			e == "X" || e == "O"
		}
	end

	def draw?
		if full? && !won?
			return true
  		elsif !full? || won?  # !(A.!B) = !A + !!B= !A + B
  			return false
  		end
  	end

  	def over?
  		won? || draw?
  	end

  	def winner
 		if won?  # there is a winner
 			winarray = won?
 			if @board[winarray[0]] == "X"
 				return "X"
 			else
 				return "O"
 			end
     elsif draw? #no one is winner
     	return false
     end
 end
 def play
 	while !over?
 		turn
 	end
 	if winner == "X"
 		puts "Congratulations X!"
 	elsif winner == "O"
 		puts "Congratulations O!"
 	elsif draw?
 		puts "Cats Game!"
 	end
 end

end