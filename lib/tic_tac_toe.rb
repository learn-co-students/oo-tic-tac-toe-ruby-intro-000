class TicTacToe
  def initialize (board = nil)
    @board= board || Array.new(9," ")
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

  def won?
    winning_combination=nil
    winning_combination = WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] != " " && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
    end
  end

  def full?
    !@board.any?{|i| i==" "}
  end

  def draw?
    true if !won? && full?
  end

  def over?
    true if won? || draw? || full?
  end

  def winner
    winning_combo = won?
    if winning_combo
      @board[winning_combo[0]]
    else
      nil
    end
  end

  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # code your input_to_index and move method here!
  def input_to_index(digit)
    index = digit.to_i - 1;
  end

  def move(index, player)
    @board[index]="#{player}"
  end

  # code your #valid_move? method here
  def valid_move?(index)
    position_on_board?(index) && !position_taken?(index)
  end

  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  # code your #position_taken? method here!
  def position_taken?(index)
    if(@board[index]=="X" || @board[index]=="O")
      return true
    end
    return false
  end

  def position_on_board?(index)
    index.between?(0,8)
  end

  def turn
    while true
      puts "Please enter 1-9:"
      input=gets.strip
      index=input_to_index(input);
      if(valid_move?(index))
        move(index,current_player)
        display_board
        break
      end
    end
    index
  end

  def turn_count
    turn=0
    @board.each do |item|
      if(item=="O" || item=="X")
        turn+=1
      end
    end
    turn
  end

  def current_player
    turn_count%2==0?"X":"O"
  end

  # Define your play method below
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