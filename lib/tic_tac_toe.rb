require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
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
    input.to_i - 1
  end

  def move(index, player="X")
    @board[index] = player
    display_board
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    index >= 0 && index <= 8 && !position_taken?(index) ? true : false
  end

  def turn_count
    @board.count{|slot| slot == "X" || slot == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    player = current_player
    puts "It's your turn, " + player + "!"
    puts "Pick 1 to 9:"
    input = gets.strip
    index = input_to_index(input)
    valid_move?(index) ? move(index,player) : turn
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
    windex1 = win_combo[0]
    windex2 = win_combo[1]
    windex3 = win_combo[2]

    if (@board[windex1] == "X" && @board[windex2] == "X" && @board[windex3] == "X")
      @winner = "X"
      return win_combo
    elsif (@board[windex1] == "O" && @board[windex2] == "O" && @board[windex3] == "O")
      @winner = "O"
      return win_combo
      end
    end
    return false
  end

  def full?
    @board.all? do |slot|
      slot == "X" || slot == "O"
    end
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    !won? ? nil : @winner
  end


  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{@winner}!"
    else puts "Cat's Game!"
    end

  end
end
