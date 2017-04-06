class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left diagonal
    [2,4,6], # Right diagonal
  ]

  def won?
  no_win = true
    WIN_COMBINATIONS.each do |win_array|
      win = []
      win_array.select do |position|
        if position_taken?(position)
          win << position
          if win.length == 3 && win_array == win && (@board[win[0]] == @board[win[1]] && @board[win[0]] == @board[win[2]])
            no_win = false
            return win_array
          end
        end
      end
    end
    if no_win
     false
    end
  end

  def full?
    [0,1,2,3,4,5,6,7,8].all?{|position| position_taken?(position)}
  end

  def draw?
    !won? && full?
  end

  def over?
    (won? && full?) || draw?
  end

  def winner
    !won? ? nil : won?.detect{|position| return @board[position]}
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    move(index, current_player)
    display_board
  end

  def play
    until over? || draw? || won?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
