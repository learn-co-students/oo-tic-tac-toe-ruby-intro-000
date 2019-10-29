class TicTacToe

  def initialize
    @board=Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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

  def move(index,current_player="X")
    @board[index]=current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
     if (index.between?(0, 8)) && (position_taken?(index) == false)
   return true
  else
    return false
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

  def turn_count
    counter=0
    @board.each do |space|
      if space=="X" || space=="O"
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

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) =="X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) =="O"
      return win_combo
        end
      end
  end


  def full?
  @board.all? do |space|
    space == "X" || space == "O"
  end
  end

  def draw?
  !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) =="X"
    return "X"
  elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) =="O"
    return "O"
    end
    end
  end

  def play
  until over?
    turn
  end
  if won?
    if winner == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  else
    puts "Cat's Game!"
  end
end
end
