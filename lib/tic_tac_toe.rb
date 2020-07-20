class TicTacToe

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
  #initialize
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
   @board = board
  end
  #board
  def board=(board)
    @board = board
  end
  def board
    @board
  end

  #input_to_index
  def input_to_index(user_input)
    converted_input = "#{user_input}".to_i
    converted_input -= 1
    return converted_input
  end
  #display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #move
  def move(index, value)
    @board[index] = value
    return @board
  end
  #position_taken
  def position_taken?(index)
    if @board[index] == " " or @board[index] == "" or @board[index] == nil
      then return false
    elsif @board[index] == "X" or @board[index] == "O"
      then return true
    end
  end
#current_player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|turn| turn == "X" or turn == "O"}
  end
  #valid_move?
  def valid_move?(index)
    if position_taken?(index) == false and index.between?(0,8)
      then true
    else
      false
    end
  end
  #turn
  def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    if valid_move?(index)
      then move(index, current_player)
           display_board
    else
      turn
    end
  end
  #won?
  def won?
    WIN_COMBINATIONS.each {|combo|
      index_0 = combo[0]
      index_1 = combo[1]
      index_2 = combo[2]

      pos1 = @board[index_0]
      pos2 = @board[index_1]
      pos3 = @board[index_2]

      if pos1 == "X" and pos2 == "X" and pos3 == "X"
        return combo
      elsif pos1 == "O" and pos2 == "O" and pos3 == "O"
        return combo
      end
    }
    return false
  end
  #full?
  def full?
    if !@board.any?{|input|input == " " }
      return true
    else
      return false
    end
  end
  #draw?
  def draw?
    if !won? and full?
      return true
    else
      return false
    end
  end
  #over?
  def over?
    if won? or full? or draw?
      return true
    else
      return false
    end
  end
  #winner?
  def winner
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
  #play
  def play
    until over?
      current_player
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
