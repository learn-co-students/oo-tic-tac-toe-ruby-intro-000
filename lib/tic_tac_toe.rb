class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  # ETC, an array for each win combination
]
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]

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

def turn_count()
  count = 0
  @board.each do |item|
    if item == "X" or item == 'O'
    count += 1
    end
  end

  count
end

def current_player()
  num = turn_count

  if num % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?()
  x = WIN_COMBINATIONS.select do |combo|

    win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  position_1 = @board[win_index_1] # load the value of the board at win_index_1
  position_2 = @board[win_index_2] # load the value of the board at win_index_2
  position_3 = @board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X" or
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    #
    return combo # return the win_combination indexes that won.
  end
  end

  if x == []
    return false
  end

  x

end
def full?
  if @board.include?(" ")
    return false
  else
    return true
  end
end
def draw?
  if full? and !won?
    return true
  else
    return false
  end

end

def over?
  if draw? or won? or full?
    return true
  end
  false

end

def winner

  if over? and won?
    combo = won?

    return @board[combo[0]]
  end
end

def play
  # 9.times do
  #   turn(board)
  # end

  while over? == false
    turn
  end

  if winner
    puts "Congratulations #{winner}!"

  elsif draw?
    puts "Cat's Game!"
  end



end
end
