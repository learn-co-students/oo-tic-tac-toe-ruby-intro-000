class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,4,8],  # Left diagonal
    [2,4,6],  # Right diagonal
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8]  # Right column
    # An array for each win combination
  ]

  def display_board()
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
    board[index] = current_player
  end

  def position_taken?(location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    counter = 0
    @board.each do |position|
      if (position != " ") && (position != "") &&  (position != nil)
        counter += 1
      end
    end
    counter
  end

  def current_player()
    if turn_count() % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        win_combination
      end
    end
  end

  def full?()
    [0,1,2,3,4,5,6,7,8].all?{|position| position_taken?(position)}
  end

  def draw?()
    !won?() && full?() == true
  end

  def over?()
    if won?() != nil
      true
    elsif draw?() == true
      true
    else full?() == false
      false
    end
  end

  def winner()
    if won?() != nil
      won = won?()
      return board[won[0]]
    end
  end

  def play()
    until over?()
      turn()
    end
    puts "Cat's Game!" if draw?()
    puts "Congratulations #{winner()}!" if won?()
  end
end
