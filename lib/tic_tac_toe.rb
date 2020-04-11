class TicTacToe
  WIN_COMBINATIONS = [  
    [0,1,2], [3,4,5], [6,7,8], # horizontals
    [0,3,6], [1,4,7], [2,5,8], # verticals
    [0,4,8], [2,4,6]  # diagnals
  ]
  
  def initialize
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    converted_input = user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index >= 0 && index <= 8
      if position_taken?(index) == false
        true
      else
        false
      end
    else
      false
    end
  end
  
  def turn
    index = gets.strip
    converted_index = input_to_index(index)
    
    if valid_move?(converted_index) == true
      move(converted_index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
  
    @board.each do |board_space|
      if board_space == "X" || board_space == "O"
        counter += 1
      end
    end
  
    counter
  end
  
  def current_player
    player = " "
  
    if turn_count % 2 == 0
      player = "X"
    else
      player = "O"
    end
  
    player
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
    
      slot_1 = @board[win_index_1]
      slot_2 = @board[win_index_2]
      slot_3 = @board[win_index_3]
    
      if slot_1 == slot_2 && slot_2 == slot_3 && position_taken?(win_index_1)
        return win_combination
      end
    end
  
    return false
  end
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end
  
  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw? || full?
      return true
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    end
  end
  
  def play
    until over? == true
      puts "Please select a number 1-9:"
      
      turn
    end
    
    display_board
    
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end






