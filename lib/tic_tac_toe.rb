class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(number)
    number.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == "" || @board[index] == " " || @board[index] == nil)
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn
    puts "Please enter 0-9:"
    number = gets.strip
    index = input_to_index(number)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
      turn
    end
  end
        
  def turn_count
    @board.count { |x| x == "X" || x == "O" }
  end
        
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |com|
    @board[com[0]] == @board[com[1]] && 
    @board[com[1]] == @board[com[2]] &&
    position_taken?(com[0])
    end
  end
  
  def full?
    @board.all? { |x| x == "X" || x == "O" }
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won? || draw?
  end
  
  def winner
    if won?
      winner = @board[won?[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
    
end
