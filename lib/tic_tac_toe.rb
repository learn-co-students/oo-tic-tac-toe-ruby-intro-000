class TicTacToe
  def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   def board=(board)
    @board = board
  end

  def board
    @board
  end

   WIN_COMBINATIONS = [
       [0,1,2],
       [2,5,8],
       [0,4,8],
       [6,4,2],
       [0,3,6],
       [3,4,5],
       [6,7,8],
       [1,4,7],
   ]

   def display_board()
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)
     user_input.to_i - 1
   end


   def move(index, current_player = "X")
     @board[index] = current_player
   end

   def position_taken?(position)
     if @board[position] != " " && board[position] != ""
       true
     else
       false
     end
   end

   def valid_move?(index)
     if index.between?(0,8) && @board[index] == " " || @board[index] == ""
       true
     else
       false
     end
   end

   def turn
     puts "Please enter 1-9"
     input = gets.strip
     index = input_to_index(input)
     if !valid_move?(index)
      turn
    else
      move(index, current_player)
    end
    display_board
  end

  def turn_count
    @board.count{|i| i == "X" || i == "O"}
  end

  def current_player
    if turn_count % 2 == 0
    "X"
    else
    "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      cell_1 = board[win_index_1]
      cell_2 = board[win_index_2]
      cell_3 = board[win_index_3]

        if cell_1 == "X" && cell_2 == "X" && cell_3 == "X"
          return win_combination
        elsif cell_1 == "O" && cell_2 == "O" && cell_3 == "O"
          return win_combination
        else
          nil
        end
     end
   end

   def full?
     if @board.detect {|cells| cells == " " || cells == ""}
        false
     else
        true
     end
   end

   def draw?
     full? && !won?
   end

   def over?
     won? || draw?
   end

   def winner
    if won = won?
      @board[won[0]]
     end
   end

   def play
     until over?
       turn
     end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end
end
