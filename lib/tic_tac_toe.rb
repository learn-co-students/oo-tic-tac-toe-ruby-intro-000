class TicTacToe
  attr_accessor :board

  def initialize()
    @board = Array.new(9){" "}
  end

  def position_taken?( index)
    !(board[index].nil? || board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant
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

  def won?()
    WIN_COMBINATIONS.each do |comb|
        return comb if comb.all? { |idx| @board[idx] == "X"  }
        return comb if comb.all? { |idx| @board[idx] == "O"  }
    end

  false
  end

  def full?()
    return true  if board.all?{|el| el == "X" || el == "O" }

  end

  def draw?
    return false if won?.is_a?(Array)
    return true if full?
    false

  end

  def over?()
    return true if draw? || won?
    false
  end

  def winner()
    return board[won?.first] if won?.is_a?(Array)
    nil
  end

  def display_board()
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  # code your input_to_index and move method here!
  def move( moves, char )
    @board[moves] = char
    display_board()
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def position_taken?(index)
    return true if board[index] == "X" || board[index] == "O"
    false
  end

  def valid_move?( index )
    return false unless index < 9 && index >= 0
    return true unless position_taken?(index)

    false
  end

  def turn()

    while true
        puts "Please enter 1-9:"
        move_pos = input_to_index(gets.chomp)
        break if valid_move?( move_pos)
    end
    move(move_pos,current_player)
    
  end

  def current_player
    return "O" if board.count("X") > board.count("O")
    "X"
  end

  def turn_count
    board.count("X") + board.count("O")
  end

  def play
      until over?
        turn
      end
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
  end



end
