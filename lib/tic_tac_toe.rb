class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
        [0,1,2], # Top row
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
      index = input.to_i
      index = index - 1
    end

    def move(index, char = "X")
      @board[index] = char
    end

    def position_taken?(index)
      if @board[index] == "X" || @board[index] == "O"
        return true
      else
        return false
      end
end

def valid_move?(index)
if position_taken?(index) == false && -1 < index && index < 10
  return true
else return false
end
end

def turn_count
  i = 0
  @board.each {|x|
    if x == "X" || x == "O"
      i += 1
    end
  }
  return i
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
end
end

def turn
  loop do
    puts "Choose a number between 1-9"
  number = gets.chomp
  index = input_to_index(number)
  if valid_move?(index) == true
    @board[index] = current_player
    display_board
    break
  elsif valid_move?(index) == false
    "Invalid move. Please choose again."
end
end
end

def won?
  i = 0
  WIN_COMBINATIONS.each {|sub_array|
   if @board[sub_array[0]] == @board[sub_array[1]] && @board[sub_array[1]] == @board[sub_array[2]] && @board[sub_array[0]] != " " && @board[sub_array[0]] != nil
   return sub_array
   i += 1
 end
 }
 if i == 0
   return false
 end
end

def full?
  if turn_count == 9
    return true
  end
end

def draw?
  if turn_count == 9 && won? == false
    return true
  else return false
  end
end

def over?
if draw? == true || won? != false
  return true
elsif turn_count < 9 && won? == false
  return false
end
end

def winner
  WIN_COMBINATIONS.each {|sub_array|
   if @board[sub_array[0]] == @board[sub_array[1]] && @board[sub_array[1]] == @board[sub_array[2]]
    if @board[sub_array[0]] == "X"
      return "X"
    elsif @board[sub_array[0]] == "O"
      return "O"
    else
      return nil
    end
  end
  }
end

def play
while draw? == false && over? == false do
  turn
end
if won? != false && (winner == "X" || winner == "O")
  puts "Congratulations #{winner}!"
end
if draw? == true
  puts "Cat's Game!"
end
end

end
