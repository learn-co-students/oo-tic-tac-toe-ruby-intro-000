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
  
  
  def move(index, token="X")
    @board[index] = token
  end
  
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      return false
    elsif @board[index] == nil
      return false      
    else 
      true
    end
  end
  
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    end
  end
  
  
  def turn_count
    counter = 0
    @board.each do |space| 
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter  
  end
  
  
  def current_player
    num = turn_count
    if num % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = input
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
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
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
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
    won? || draw? || full?
  end
  
  
  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  
  
  def play
    if !over?
      turn
      play
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end