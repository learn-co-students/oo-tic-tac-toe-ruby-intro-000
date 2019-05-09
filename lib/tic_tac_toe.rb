class TicTacToe

	WIN_COMBINATIONS = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6]
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

	def move(index, current_player)
	  @board[index] = current_player
	end

	def position_taken?(location)
	  @board[location] != " " && @board[location] != ""
	end

	def valid_move?(index)
	  index.between?(0,8) && !position_taken?(index)
	end

	def turn
		puts "Please enter 1-9"
	  input = gets.strip
	  index = input_to_index(input)
		valid_move?(index) ? move(index, current_player) : turn
	  display_board
	end

	def turn_count
		@board.count { |n| n =="X" || n == "O" }
	end

	def current_player
		turn_count.even? ? "X" : "O"
	end

	def won?
		# check won combination
	  WIN_COMBINATIONS.each do |combionation|
			if combionation.all? do |i|
					@board[i] == "X"
				end
				#return wining x combination
				return combionation
			elsif
				combionation.all? do |i|
					@board[i] == "O"
				end
				#return wining 0 combination
				return combionation
			end
	  end
		# not won
		return false
	end

	def full?
		#board.none? { |i| i == " " || i == "" }
		@board.all? { |x| x == "X" || x == "O"}
	end

	def draw?
		!won? && full?
	end

	def over?
		won? || draw? || full?
	end

	def winner
		if won?
			win_index = won?.first
	    @board[win_index]
	  end
	end

	def play
		while !over?
	    turn
	  end
	  if won?
	    puts "Congratulations #{winner}!"
	  end
		if draw?
			puts "Cat's Game!"
		end
	end

end
