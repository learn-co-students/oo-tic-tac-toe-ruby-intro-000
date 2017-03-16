class TicTacToe

def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  @board = board
end

def board=(board)
  @board = board
end

def board
  @board
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
  cell1 = " #{@board[0]} "
  cell2 = " #{@board[1]} "
  cell3 = " #{@board[2]} "
  cell4 = " #{@board[3]} "
  cell5 = " #{@board[4]} "
  cell6 = " #{@board[5]} "
  cell7 = " #{@board[6]} "
  cell8 = " #{@board[7]} "
  cell9 = " #{@board[8]} "
  box = "|"
  line = "-----------"
  print cell1, box, cell2, box, cell3
  print "\n",line
  print "\n",cell4, box, cell5, box, cell6
  print "\n",line
  print "\n",cell7, box, cell8, box, cell9, "\n"
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(index, char)
  @board[index] = char
end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
      counter +=1
        end
      end
    return counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, "#{current_player}")
    display_board
  else turn
end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    combo.each do
    if position_taken?(combo[0]) == true && position_taken?(combo[1]) == true && position_taken?(combo[2]) == true && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo
    end
  end
  end
  return false
end

def full?
  if @board.include?(" ")
    return false
  else return true
  end
end

def draw?
  a = won?
  b = full?
  if a == false && b == true
    return true
  elsif a == false && b == false
    return false
  else return false
end
end

def over?
  if full? == true
    return true
  elsif won? != false
    return true
  end
  return false
end

def winner
  if won?
    return "#{@board[won?[0]]}"
  end
end

def play
  until over? == true
    turn
    if draw? == true
      break
    end
  end
  if draw? == true
    puts "Cat's Game!"
  elsif won? != false
    puts "Congratulations #{winner}!"
  end
end


end
