class TicTacToe
include Comparable
  def initialize(board = nil)
    @board=board||Array.new(9, " ")
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

  def move(input, symbol)
    input_to_index(input)
    @board[@index] = symbol
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def position_taken?(index)
  @position = @board[index]
    if @position==(" "||""||nil)
      return false
    #elsif position==""
    #  return false
    #elsif position==nil
    #  return false
  elsif @position=="X"
      return true
    elsif @position=="O"
      return true
    end
  end

  def valid_move?(position)
    @index=position.to_i-1
    if @index.between?(0, 8)
      if position_taken?(@index)
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input_to_index(input)
    if valid_move?(input)
      symbol = current_player
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
  count = 0
    while count<8 do
      if @board.all? {|empty| empty==" "}
         return false
      elsif position_taken?(WIN_COMBINATIONS[count][0])&&position_taken?(WIN_COMBINATIONS[count][1])&&position_taken?(WIN_COMBINATIONS[count][2])&&@board[WIN_COMBINATIONS[count][0]]==@board[WIN_COMBINATIONS[count][1]]&&@board[WIN_COMBINATIONS[count][1]]==@board[WIN_COMBINATIONS[count][2]]
         return WIN_COMBINATIONS[count]
         break
      end
       count+=1
    end
  if full?&&count==8
     return false
  end
  end

  def full?
    if @board.any?{|empty| empty==" "}
      return false
    else
      return true
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end

  def over?
  if won?
    return true
  elsif full?
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
      if won?
        break
      elsif draw?
        break
      end
    end
    if won?
      puts "Congratulations "+winner+"!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
