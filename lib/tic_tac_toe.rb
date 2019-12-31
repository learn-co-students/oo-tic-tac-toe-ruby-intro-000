class TicTacToe

  def initialize(board=nil)
    @board=board || Array.new(9," ")
  end

  WIN_COMBINATIONS=[[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index=input.to_i
    index=index-1
    if index >=0 || index <=8
      return index
    else
      return -1
    end
  end

  def move(index,token="X")
    @board[index]=token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index <=8 && index >=0
      if !position_taken?(index)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn_count
    turn_count=0
    @board.each do |position|
      if position=="X" || position=="O"
        turn_count+=1
      end
    end
    return turn_count
  end
end
