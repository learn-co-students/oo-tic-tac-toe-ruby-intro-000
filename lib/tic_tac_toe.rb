class TicTacToe

  def initialize(board= Array.new(9, " "))
    @board=board
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


  def input_to_index(input)
    input.to_i - 1
  end


  def move(input, player="X")
    index = input_to_index(input)
    @board[index] = player
  end


  def position_taken?(index)
    !(@board[index] == " " || @board[index].nil?)
  end


  def valid_move?(input)
    index = input_to_index(input)
    !position_taken?(index) && index.between?(0,8)
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    if valid_move?(input)
      move(input, current_player)
      display_board
      won?
    else
    turn
    end
  end


  def turn_count
    @board.count{|turns|turns=="X"||turns=="O"}
  end


  def current_player
    if turn_count % 2 == 0
    return"X"
  else
    return"O"
  end
end


def won?
    WIN_COMBINATIONS.find do |win|
     win_index_0 = win[0]
     win_index_1 = win[1]
     win_index_2 = win[2]

     if @board[win_index_0] == "X" && @board[win_index_1] == "X" && @board[win_index_2] == "X"
       return win
     elsif @board[win_index_0] == "O" && @board[win_index_1] == "O" && @board[win_index_2] == "O"
       return win
     end
   end
  end


  def full?
    @board.all? { |index| index != " " }
  end


  def draw?
    !won? && full?
  end


  def over?
    if won? || draw?
    return true
  else
    return false
  end
end


  def winner
    WIN_COMBINATIONS.each do |win_combination|
     win_index_0 = win_combination[0]
     win_index_1 = win_combination[1]
     win_index_2 = win_combination[2]

     if @board[win_index_0] == "X" && @board[win_index_1] == "X" && @board[win_index_2] == "X"
       return "X"
     elsif @board[win_index_0] == "O" && @board[win_index_1] == "O" && @board[win_index_2] == "O"
       return "O"
     elsif !won?
       return nil
     end
   end
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
