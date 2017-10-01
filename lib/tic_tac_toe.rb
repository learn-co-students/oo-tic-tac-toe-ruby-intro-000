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
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    position = input.to_i()-1
  end

  def move(position, player)
    @board[position] = player
  end

  def position_taken?(position)
    if @board[position]=="X" || @board[position] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position >= 0 && position <= 8
      !position_taken?(position)
    else
      false
    end
  end

  def turn_count
    count = 0
    @board.each do |field|
      if field == "X" || field == "O"
        count+=1
      end
    end
    count
  end

  def current_player
    if (turn_count % 2).even?
      "X"
    else
      "O"
    end
  end

  def turn
    input = gets
    position = input_to_index(input)
    until valid_move?(position)
      input =gets
      position = input_to_index(input)
    end
    move(position,current_player)
    display_board
  end

  def won?
    ret = false
    WIN_COMBINATIONS.any? do |win_combination|
      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        ret = win_combination
      end
    end
    ret
  end

  def full?
    @board.none? {|position| position == " "}
  end

  def draw?
    #returns true for a draw
    #returns false for a won game
    #returns false for an in-progress game
    if full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
  # returns true for a draw'
  # returns true for a won game
  # returns false for an in-progress game
    if draw? == true || won? != false
      true
    else
      false
    end
  end

  def winner
    ret = won?
    if ret != false
      @board[ret[0]]
    end
  end

  def play
    #puts "Please enter a number between 1 and 9:"
    while over? == false
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"

    #if winner != false
    #  puts "Congratulations #{winner}!" #{@board[winner[0]]}!"
    #else
    #  puts "Cat's Game!"
    end
  #  if winner == false
  #    puts "Draw"
  #  else
  #    puts "Congratulations #{winner[0]}"
  #  end
  end

end
