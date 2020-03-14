
class TicTacToe
  def initialize(board=nil)
    @board = [" "," ", " "," "," ", " "," "," ", " "]
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
    puts  " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    sep = "-----------"
    puts sep
    puts  " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts sep
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    num = input.to_i
    return num-1
  end

  def move(input, character)
    @board[input] = character
    return @board
  end

  def position_taken?(input)
    if @board[input] == "X" || @board[input] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    if position_taken?(position) == false && position.between?(0,8)
      return true
    else
      return false
    end
  end

  def turn_count
    count = 0
    @board.each do |current_idx|
      if current_idx == "X" || current_idx == "O"
        count+=1
      end
    end
    return count
  end

  def current_player
    num = turn_count
    num.odd? == true ? "O" : "X"
  end

  def turn
    puts 'Give me number 1-9'
    input = gets.strip
    idx = input_to_index(input)
    if valid_move?(idx) == true
      move(idx, current_player)
      display_board
    else
      puts 'ERROR!!!!'
      puts "Lets try this again!"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_array|
      if @board[winning_array[0]] == 'X' && @board[winning_array[1]] == 'X' && @board[winning_array[2]] == 'X'
        return winning_array

      elsif @board[winning_array[0]] == 'O' && @board[winning_array[1]] == 'O' && @board[winning_array[2]] == 'O'
        return winning_array
      end
    end
    return false
  end

  def full?
    @board.all? do |current_idx|
      current_idx == "X" || current_idx == "O"
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if won? != false || draw? == true
      return true
    else return false
    end
  end
  def winner
    winning = won?
    if won? != false
      return @board[winning[0]]
    else
      return nil
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      win = winner
      puts "Congratulations #{win}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
#end of class
end
