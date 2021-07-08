
##easier the second time around.  needed to rewrite the winner method to facilitate returning the
## combo and also congratulate the winner



class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
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
  end


  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index) == false
        true
      end
    end
  end

  def turn_count
    return @board.count("X") + @board.count("O")
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    value = current_player
      if valid_move?(index)
        move(index, value)
        display_board
      else
        turn
      end
  end

  def current_player
    turn_count
    if @board.count(" ") == 9
      return "X"
    end
    if @board.count(" ").even?
      return "O"
    else
      return "X"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
        position_1 = @board[combo[0]]
        position_2 = @board[combo[1]]
        position_3 = @board[combo[2]]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo

       elsif position_1 == "O"  && position_2 == "O" && position_3 == "O"
        return combo
        end
    end
    return false
  end

  def full?
    @board.select do |space|
      if space == " "
        return false
      end
    end
  return true
  end

  def draw?
    if won? == false && full? == true
        return true
      else
        return false
      end
      return false
  end

  def over?
    draw?
    won?
    full?
    if draw? || full? || won?
      return true
    end
    return false
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
        position_1 = @board[combo[0]]
        position_2 = @board[combo[1]]
        position_3 = @board[combo[2]]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"

       elsif position_1 == "O"  && position_2 == "O" && position_3 == "O"
        return "O"
        end
    end
    return nil
  end



  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if over?
      if draw?
        puts "Cat's Game!"
      end
    end
  end
end
