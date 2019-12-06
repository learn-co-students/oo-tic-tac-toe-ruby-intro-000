class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
    display_board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if index.between?(0, 8) && valid_move?(index)
      move(index, token)
    else
      turn
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
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      if position_taken?(win_combination[0])
        if position_1 == position_2 && position_2 == position_3
          return win_combination
        end
      end
    end
    false
  end

  def full?
    if !@board.find{|element| element == " "}
      true
    else
      false
    end
  end

  def draw?
    if full?
      if !won?
        return true
      end
    end
    false
  end

  def over?
    if won?.class == Array || draw?
      true
    else
      false
    end
  end

  def winner
    if !won?
      nil
    else
      pos = won?[0]
      @board[pos]
    end
  end

  def play
    puts "Welcome to Tic Tac Toe"
    display_board
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
