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
    [2,4,6],
    [0,4,8]
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
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    position_taken?(index) == false && index.between?(0,8)
  end

  def turn_count
    @board.count{|cell| cell == "X" || cell == "O"}
  end

  def current_player
    turn_count.even? == true ? "X" : "O"
  end

  def turn
    puts "Please enter number 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]

    win_x = current_combo.all? { |cell| @board[cell] == "X" }
    win_o = current_combo.all? { |cell| @board[cell] == "O" }

    if win_x == true || win_o == true
      return current_combo
    end
    combo += 1
  end
  false
  end

  def full?
    @board.none? do |cell|
        cell == "" || cell == " "
      end
  end

  def draw?
    if won?
      false
    elsif full? == false
      false
    else
      true
    end
  end

  def over?
    if won?
    true
  elsif full?
    true
  elsif draw?
    true
  else
    false
    end
  end

  def winner
    if won? == false
      nil
    else
      win_1 = won?
      @board[win_1[0]]
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
