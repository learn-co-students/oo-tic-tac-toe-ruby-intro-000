class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end



  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def input_to_index(input)
    input.to_i - 1
  end


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def move(index, token)
    @board[index] = token
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


  def over?
    won? || draw?
  end


  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
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

  def draw?
    !won? && full?
  end

  def full?
    !@board.any?{|x| x == "" || x == " "}
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

end
