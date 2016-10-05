class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token)
    index = position.to_i - 1

    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(position)
    index = position.to_i - 1
    if index.between?(0, 8) && !(position_taken?(index))
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"

    index = gets.strip

    if valid_move?(index)
      player = current_player
      move(index, player)
    else
      turn
    end

    display_board
  end

  def turn_count
    count = 0
    @board.each do | index |
      if index != " "
        count += 1
      end
    end
    count
  end

  def current_player
    count = turn_count
    if count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    return_array = []

    WIN_COMBINATIONS.each do | win_combo |
      if win_combo.all?{ | i | @board[i] == "X"} || win_combo.all?{ | i | @board[i] == "O"}
        return_array = win_combo
      end
    end

    if return_array == []
      false
    else
      return_array
    end
  end

  def full?
    if @board.all?{ | i | i != " "}
      true
    else
      false
    end
  end

  def draw?
    if full? == true && won? == false
      true
    elsif won? != false
      false
    else
      false
    end
  end

  def over?
    if won? != false || draw? == true
      true
    else
      false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if draw? == true
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end


end
