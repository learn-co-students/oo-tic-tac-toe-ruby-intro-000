class TicTacToe
  def initialize(board = nil)
    @board=board || Array.new(9, " ")
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
  index = input.to_i - 1
  @index = index
end

def move(index, current_player="X")
  @board[index.to_i] = current_player
end

def position_taken?(position)
  @board[position] != " " && @board[position] != "" &&  @board[position] != nil
end

def valid_move?(position)
position.to_i.between?(0,8) && !position_taken?(position.to_i)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player
  if valid_move?(index)
    move(index, player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count {|token| token == "X" || token == "O"}
end

def current_player
 turn_count % 2 == 0 ? "X" : "O"
end

def won?
   WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
    end

  def full?
    if @board.detect {|i| i == " " || i == nil}
      false
    else
      true
    end
  end

   def draw?
    if full? && !won?
      true
    else
      false
    end
  end

   def over?
    if draw? || won?
      true
    else
      false
    end
  end

   def winner
    if win_combination = won?
      @board[win_combination[0]]
    else
      return nil
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
