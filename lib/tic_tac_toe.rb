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
  def initialize()
    @board =  Array.new(9," ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, current_player)
    @board[index] = current_player
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end
  def turn_count
    turn_count = 0
    @board.each do |slot|
      if slot=="X" || slot=="O"
        turn_count+=1
      end
    end
    turn_count
  end
  def current_player
    turn_count%2==0 ? "X" : "O"
  end
  def won?
    odp = WIN_COMBINATIONS.detect do |comb|
      @board[comb[0]]=="X" && @board[comb[1]]=="X" && @board[comb[2]]=="X" || @board[comb[0]]=="O" && @board[comb[1]]=="O" && @board[comb[2]]=="O"
        end
  odp ? odp : false
  end
  def full?
    @board.all?{|slot| slot == "X" || slot == "O"}? true : false
  end
  def draw?
    won? ? false : full? ? true : false
  end
  def over?
    won? || draw? || full?
  end
  def winner
    win = won?
    if(!win)
      nil
    else
      @board[win[0]]
    end
  end
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end
end
