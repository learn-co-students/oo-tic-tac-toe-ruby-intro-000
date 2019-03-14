
class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9," ") || board
  end

  #constant
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

  def display_board
    board = @board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end


  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(location)
    return @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    return index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
   tc =  @board.select do |item|
      item != " "
   end
   return tc.length
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    while !valid_move?(index) do
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    move(index,current_player)

    display_board

  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?

    if @board.all?{|j| j  == " "}
      return false
    end

    WIN_COMBINATIONS.each do |w|
    if w.all?{|i| @board[i] == "X"} || w.all?{|i| @board[i] == "O"}
        return w
    else
       next
    end
  end

  return false

 end

 def full?
  if @board.any?{|i| i == " "}
    return false
  else
    return true
  end
 end

 def draw?
   if won? && (full?|| !full?)
     return false
   elsif !won? && full?
     return true
   end
 end

 def over?
   if  won? || draw?
     return true
   else
     return false
   end
 end

def winner

  if !won?
    return nil
  end

  if won?.any?{|i| @board[i] == "X"}
    return "X"

  elsif won?.any?{|i| @board[i] == "O"}
    return "O"
  end

end

def play
  turn
  until over?
    turn
  end
  if draw?
    print "Cat's Game!"
  end
  if won?
    print "Congratulations #{winner}!"
  end

  end
end

tictactoe = TicTacToe.new("board")
tictactoe.play
