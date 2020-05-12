class TicTacToe
	def initialize(board=nil)
		@board = board || Array.new(9, " ")
	end

	WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 4, 8],
  [0, 3, 6],
  [3, 4, 5],
  [6, 4, 2],
  [1, 4, 7],
  [6, 7, 8],
  [2, 5, 8]
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

	def move(index, value="X")
	  @board[index] = value
	end

	def position_taken?(index)
  	if @board[index] == "" || @board[index] == " " || @board[index] == nil
    	false
  	elsif
    	@board[index] == "X" || @board[index] == "O"
    	true
  	else
    	nil
  	end
end

	def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

	def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
    	move(index, current_player)
    	display_board
  else
    turn
  end
end

	def turn_count
  	turn=0
  	@board.each do |token|
    	if(token=="X" || token=="O")
      	turn+=1
			end
		end
		turn
	end

	def current_player
  turn_count % 2 == 0? "X": "O"
end

	def won?
  	winning_combination = WIN_COMBINATIONS.detect do |combination|
    	@board[combination[0]] != " " && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
		end
	end

	def full?
  	(@board).none?{|i| i == " "}
	end

	def draw?
  	full? && !won?
  end

	def over?
  full? || won? || draw?
end

def winner
  winning_combination = won?
  if winning_combination
    @board[winning_combination[0]]
  else
    nil
  end
end

	def play
		until over?
			turn
		end
		if won?
			if value = "X"
				puts "Congratulations X!"
		end
		if value = "O"
				puts "Congratulations O!"
		end
		else draw?
			puts "Cat's Game!"
		end
	end

end
