class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  #across, 0-2
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #down, 3-5
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal, 6-7
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
    input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    (@board.count{|element|element=="X"}) + (@board.count{|element|element=="O"})
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move? (index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    win_index_0 = WIN_COMBINATIONS[0]
    win_index_1 = WIN_COMBINATIONS[1]
    win_index_2 = WIN_COMBINATIONS[2]
    win_index_3 = WIN_COMBINATIONS[3]
    win_index_4 = WIN_COMBINATIONS[4]
    win_index_5 = WIN_COMBINATIONS[5]
    win_index_6 = WIN_COMBINATIONS[6]
    win_index_7 = WIN_COMBINATIONS[7]
    if @board[win_index_0[0]] == "X" && @board[win_index_0[1]] == "X" && @board[win_index_0[2]] == "X"
      win_index_0
    elsif @board[win_index_0[0]] == "O" && @board[win_index_0[1]] == "O" && @board[win_index_0[2]] == "O"
      win_index_0
    elsif @board[win_index_1[0]] == "X" && @board[win_index_1[1]] == "X" && @board[win_index_1[2]] == "X"
      win_index_1
    elsif @board[win_index_1[0]] == "O" && @board[win_index_1[1]] == "O" && @board[win_index_1[2]] == "O"
      win_index_1
    elsif @board[win_index_2[0]] == "X" && @board[win_index_2[1]] == "X" && @board[win_index_2[2]] == "X"
      win_index_2
    elsif @board[win_index_2[0]] == "O" && @board[win_index_2[1]] == "O" && @board[win_index_2[2]] == "O"
      win_index_2
    elsif @board[win_index_3[0]] == "X" && @board[win_index_3[1]] == "X" && @board[win_index_3[2]] == "X"
      win_index_3
    elsif @board[win_index_3[0]] == "O" && @board[win_index_3[1]] == "O" && @board[win_index_3[2]] == "O"
      win_index_3
    elsif @board[win_index_4[0]] == "X" && @board[win_index_4[1]] == "X" && @board[win_index_4[2]] == "X"
      win_index_4
    elsif @board[win_index_4[0]] == "O" && @board[win_index_4[1]] == "O" && @board[win_index_4[2]] == "O"
      win_index_4
    elsif @board[win_index_5[0]] == "X" && @board[win_index_5[1]] == "X" && @board[win_index_5[2]] == "X"
      win_index_5
    elsif @board[win_index_5[0]] == "O" && @board[win_index_5[1]] == "O" && @board[win_index_5[2]] == "O"
      win_index_5
    elsif @board[win_index_6[0]] == "X" && @board[win_index_6[1]] == "X" && @board[win_index_6[2]] == "X"
      win_index_6
    elsif @board[win_index_6[0]] == "O" && @board[win_index_6[1]] == "O" && @board[win_index_6[2]] == "O"
      win_index_6
    elsif @board[win_index_7[0]] == "X" && @board[win_index_7[1]] == "X" && @board[win_index_7[2]] == "X"
      win_index_7
    elsif @board[win_index_7[0]] == "O" && @board[win_index_7[1]] == "O" && @board[win_index_7[2]] == "O"
      win_index_7
    else
      return false
    end
  end

  def full?
    @board.none?{|element|element==" "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if !!won? && @board[won?[0]] == "X"
      "X"
    elsif !!won? && @board[won?[0]] == "O"
      "O"
    else
      return nil
    end
  end

  def play
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
