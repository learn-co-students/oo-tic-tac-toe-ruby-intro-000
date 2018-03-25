class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS=[
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
    (input.to_i)-1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    if (!position_taken?(index)&&index.between?(0,8))
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    index=gets.strip
    index=input_to_index(index)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter=0
    @board.each do |square|
      if square=="X"||square=="O"
        counter+=1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]

      position_1=@board[win_index_1]
      position_2=@board[win_index_2]
      position_3=@board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      #else
        #return false
      end
    end
    false
  end

  def full?
    @board.all?{|square| square=="X"||square=="O"}
  end

  def draw?
    if !won?&&full?
      true
    else
      false
    #elsif !won(board)&&!full?(board)
      #false
    #elsif won?(board)
      #false
    end
  end

  def over?
    if won?||draw?||full?
      true
    end
  end

  def winner
    if won?!=false
      winning_combo=won?
      winning_combo.each do |winning_letter_index|
        return @board[winning_letter_index]
      end
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end

    if winner=="O"||winner=="X"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end




end
