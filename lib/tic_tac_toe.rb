class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal
    [2,4,6]  # Diagonal
  ]

  def display_board
    puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, default_player)
    @board[index] = default_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    else return false
    end
  end

  def turn
      default_player = current_player
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index) == true
        move(index, default_player) && display_board
      elsif over? == false
        turn
      else over? == true
        false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        else
          false
        end
      end
     false
  end

  def full?
     @board.all? { |e| e != " "}
  end

  def draw?
    won? == false && full? == true
  end

  def over?
    won? != false || full? == true || draw? == true
  end

  def winner
    if won?
      index = won?[0]
      @board[index]
    end
  end

  def play
    until over?
      turn
    end

    if over? && draw? == false
        puts "Congratulations #{winner}!"
    else over? && draw? == true
        puts "Cat's Game!"
    end
  end


end
