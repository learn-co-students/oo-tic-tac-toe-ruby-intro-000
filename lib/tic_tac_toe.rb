class TicTacToe

def initialize
  @board = [" "," "," "," "," "," "," "," "," ",]
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

def input_to_index(input)
  input.to_i - 1
end

def move(index,value)
  @board[index] = value
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == ""
    false
  elsif @board[index] == nil
    false
  else true
 end
end

def valid_move?(index)
if index.between?(0,8) && !(position_taken?(index))
  true
 else false
 end
end

def turn_count
  count = 0
  @board.each do |i|
    if i == "X" || i == "O"
      count += 1
    end
end
return count
end

def current_player
  if turn_count.even?
    return "X"
  else return "O"
end
end

def turn
 input = gets.strip
 index = input_to_index(input)

 if valid_move?(index)

   move(index,current_player)
   display_board

 else
   puts "Invalid move. Please enter 1-9:"
   until valid_move?(index)
  input = gets.strip
  index = input_to_index(input)

  end
end
end

def won?
  WIN_COMBINATIONS.each do |winner_set|
    if position_taken?(winner_set[0]) &&
       @board[winner_set[0]] == @board[winner_set[1]] &&
       @board[winner_set[0]] == @board[winner_set[2]]
       return winner_set
    end
  end
  false
end

def full?
  @board.none? do |board_taken|
    if board_taken == " "
      true
    else
      false
    end
  end
end

def draw?
  if !(won?) && full?
    true
  else
    false
  end
end

def over?
  if won? || draw?
    true
  else
    false
  end
end

def winner
  if won?
  return @board[won?[0]]
else
  nil
  end
end

def play
  puts "Let's Play Tic Tac Toe!"
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
