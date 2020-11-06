class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (num)
  num.to_i - 1
end

def move(index, value = "X")
  @board[index] = value
end

def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter a number 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def over?
  won? || draw?
end

def won?
  a = WIN_COMBINATIONS.find{
    |combo|
    @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
  }
  b = WIN_COMBINATIONS.find{
    |combo|
    @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  }
  return a || b
end

def draw?
  !won? && full?
end

def full?
  !@board.any?{|x| x == "" || x == " "}
end

def winner
  if won?
    @board[won?[0]] == "X" ? "X" : "O"
  else
    nil
  end
end

def play

  until over?
    turn
  end
  if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
   elsif draw?
      puts "Cat's Game!"
   end
end

end
