class TicTacToe
  def initialize(board = Array.new(9," "))
    @board = board
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
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(input, player = "X")
    index = input.to_i - 1
    @board[index] = player
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i - 1
    if valid_move?(input)
      player = current_player
      move(input, player)
      display_board
    else
      turn
    end
  end
  def turn_count
    count = 0
    @board.each do |slot|
      if slot == "X" || slot == "O"
        count += 1
      end
    end
    count
  end
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  def won?
    win = false
    WIN_COMBINATIONS.each do |wincombination|
      if @board[wincombination[0]] == "X" && @board[wincombination[1]] == "X" && @board[wincombination[2]] == "X"
        win = wincombination
      elsif @board[wincombination[0]] == "O" && @board[wincombination[1]] == "O" && @board[wincombination[2]] == "O"
        win = wincombination
      end
    end
    win
  end
  def full?
    @board.all? do |slot|
      slot == "X" || slot == "O"
    end
  end
  def draw?
    draw = false
    full = full?
    won = won?
    if full == true && won == false
      draw = true
    end
  end
  def over?
    over = false
    if won? != false || draw? == true
      over = true
    end
  end
  def winner
    if won? == false
      nil
    elsif @board[won?[0]] == "X"
      "X"
    elsif @board[won?[1]] == "O"
      "O"
    end
  end
  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cats Game!"
    end
  end
end
