class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  #WIN_COMBINATIONS is a constant that holds a nested array for possible win index combinations
WIN_COMBINATIONS = [
  [0,1,2], #each of these will == win_combination when itereated with .each
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
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

def move(index, player_token)
  @board[index] = player_token
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do |player_char|
    if player_char == "X" || player_char  == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0
    "X"
  elsif turn_count % 2 != 0
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
  #grab each index from the win_combination that composes a win
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  #load the value of the board at win_index_X
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

  #if the winning combiation indexes are of the same letter that that letter wins
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      #returns the winning combination array indexes aka win_combination aka the winning array
        return win_combination
    end
  end

  #if all the indexes are empty return false
  @board.all? do |number|
    if number == " "
      return false
    end

  end
end

def full?
  @board.all?{|token| token=="X" || token=="O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?
    win_array = won?
    @board[win_array[0]]
  else
    nil
  end
end

def play
  while !(over?)
    turn
  end
  if (won?) !=false
    puts "Congratulations #{winner}!"
  elsif (draw?) == true
    puts "Cat's Game!"
  end
end
end
