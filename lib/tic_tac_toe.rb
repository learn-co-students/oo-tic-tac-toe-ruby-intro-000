class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def initialize
    @board = Array.new(9, " ")
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

  def move(index, token)
    @board[index-1] = token
  end

  def position_taken?(location)
    @board[location] == 'X' || @board[location] == 'O'
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input.to_i, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    win = nil
    WIN_COMBINATIONS.each {|win_array|
      if @board[win_array[0]] == 'X' && @board[win_array[1]] == 'X' && @board[win_array[2]] == 'X'
        win = win_array
      elsif @board[win_array[0]] == 'O' && @board[win_array[1]] == 'O' && @board[win_array[2]] == 'O'
        win = win_array
      end
    }
    win
  end

  def full?
    !(@board.any? {|location| location == " " || location == nil})
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def turn_count
    @board.count {|item| item == 'X' || item == 'O'}
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
