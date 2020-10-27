class TicTacToe
  
  
  
  def initialize
    @board = board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    
  end
  
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
      ]
  
  
  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    print "-----------"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    print "-----------"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false 
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else 
      return false
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |index| 
      if index == "X" || index == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end
  end
  
  def turn
    puts "Player choose move by specifying a position between 1-9."
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Player the move is invalid, please make another move"
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
     if position_1 == position_2  && position_2 == position_3 && position_taken?(win_index_1)
    return win_combination   
  end
end
return false
end

def full?
  if @board.any? { |index| index == " " || index == "" || index == nil }
    return false
  else
    return true
  end
end
  
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

def over?
  if draw? || won?
    return true 
  else
    return false 
  end
end

def winner
  if won?
    return @board[won?[0]]
  else
    return nil
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
  else draw?
    puts "Cat's Game!"
  end
end

end