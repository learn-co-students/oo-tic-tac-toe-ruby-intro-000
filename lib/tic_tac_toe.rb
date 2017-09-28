class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

def input_to_index(user_input)
  user_input.to_i - 1
end
def move(index, current_player = "X")
  @board[index] = current_player
end
def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
def turn
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
def won?
      combo = 0
      while combo < WIN_COMBINATIONS.length
        current_combo = WIN_COMBINATIONS[combo]

        win1 = current_combo.all? { |position| @board[position] == "X" }
        win2 = current_combo.all? { |position| @board[position] == "O" }

        if win1 == true || win2 == true
          return current_combo
        else
         false
        end

        combo += 1
      end
end
def full?
  @board.all? do |i|
    i == "X" || i == "O"
  end
end
def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

def over?
  if draw? || won?
    return true
  else return false
  end
end
def winner
    winner = won?
    if winner != nil
      return @board[winner[0]]
    end
  end
  def play
  until over?
    turn
    end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end

  end

end
