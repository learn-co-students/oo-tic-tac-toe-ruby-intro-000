class TicTacToe
  def initialize(board=nil)
    @board  = board || Array.new(9, " ")
    display_board
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def valid_move?(index)
    if index>=0 && index<9
      return !position_taken?(index)
    else
      return false
    end
  end
  def move(index, current_player)
    @board[index] = current_player
  end

  def current_player
    turn_count % 2 ==0? "X" : "O"
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
                      [0,1,2],#top_row_win
                      [3,4,5],#middle_row_win
                      [6,7,8],#bottom_row_win
                      [0,3,6],#left_col_win
                      [1,4,7],#middle_col_win
                      [2,5,8],#right_col_win
                      [0,4,8],#diagonal_1_win
                      [2,4,6] #diagonal_2_win
                    ]

  def won?
    a=false
    WIN_COMBINATIONS.each do |i|
      if @board[i[0]]=="X" && @board[i[1]]=="X" && @board[i[2]]=="X"
        a= i
      end
      if @board[i[0]]=="O" && @board[i[1]]=="O" && @board[i[2]]=="O"
        a= i
      end
    end
    return a
  end

  def full?
    return @board.all?{|i| !(i.nil? || i == " ") }
  end

  def draw?
    if full? && !won?
      puts "Cat's Game!"
      return true
    else
      return nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  def play
    until over?
      turn
    end
    winner
  end

  def over?
    if draw?
      return true
    elsif won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      puts "Congradulations #{@board[won?[0]]}!"
      return @board[won?[0]]
    end
  end
end
