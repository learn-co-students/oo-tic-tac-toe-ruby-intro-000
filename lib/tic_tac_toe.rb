class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # m row
  [6,7,8], # b row
  [0,3,6], # l col
  [1,4,7], # m col
  [2,5,8], # r col
  [0,4,8], # l diag
  [2,4,6]  # r diag
]


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

  def move(index, current_player = "X")
    index = index.to_i - 1
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index = index.to_i - 1
    index.between?(0,9) && !position_taken?(index)
  end

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
turns = turn_count
    if turns % 2 == 0
      "X"
    else "O"
    end
  end


   def turn
     puts "Please enter 1-9:"
     input = gets.to_s
    input = input.strip
#     index = input_to_index(input)
     if valid_move?(input)
       curr_player = current_player
       move(input, curr_player)
      display_board
     else
       turn
     end
   end

   def won?
     WIN_COMBINATIONS.detect do |win_combination|
       @board[win_combination[0]] == @board[win_combination[1]] &&
       @board[win_combination[1]] == @board[win_combination[2]] &&
       position_taken?(win_combination[0])
     end
   end

   def full?
     @board.all? do |char|
       char == "X" || char == "O"
     end
   end

   def draw?
     !won? && full?
   end

   def over?
     won? || draw?
   end

   def winner
     if won? != nil
       win_combo = won?
       return @board[win_combo[0]]
     end
   end

   def play
     until over?
     turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cats Game!"
     end
   end



end
