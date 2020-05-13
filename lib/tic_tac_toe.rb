class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #second row
    [6,7,8], #third row
    [0,3,6], #1st col
    [1,4,7], #2nd col
    [2,5,8], #3rd col
    [0,4,8], #first diagnol
    [2,4,6]  #second diagnol
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(input)
    input = input.to_i
    index = input - 1
    index
  end


  def move(index,character)
    @board[index] = character
  end


  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    elsif @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end


  def valid_move(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    end
  end


  def turn
    puts "Please enter 1-9:"
    num = gets.to_i
    index = input_to_index(num)
    if valid_move?(board,index)
      move(index, current_player(board))
      display_board
    else
      until valid_move?(board,index)
        puts "Please enter 1-9:"
        num = gets.to_i
        index = input_to_index(num)
      end
    end
  end


  def turn_count
    count = []
    @board.each do |cell|
      if cell == "X" || cell =="O"
        count.push(1)
      end
    end
    count.length.to_i
  end


  def current_player
    num_ = turn_count
    if num_% 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_0 = win_combo[0]
      win_index_1 = win_combo[1]
      win_index_2 = win_combo[2]

      position_1 = board[win_index_0]
      position_2 = board[win_index_1]
      position_3 = board[win_index_2]

      if position_1 == position_2 && position_2 == position_3 && position_taken?
        return win_combo
      end
    end
    return false
  end


  def full?(board)
    @board.all? {|index| index == "X" || index == "O"}
  end


  def draw?
    if !won? && full?
      true
    end
  end


  def winner(board)
    if win_combo = won?
      @board[win_combo.first]
    end
  end


  def play(board)
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
