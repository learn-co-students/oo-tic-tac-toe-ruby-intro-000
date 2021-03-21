class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]

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

  def move(index, current_player)
    @board[index] = current_player
  end


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(@board, index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(@board, index)
      puts "Input is invalid. Try another number."
      turn(@board)
    end
    move(index, current_player(@board))
    display_board(@board)
  end

  def play
    turn(@board) until over?(@board)
    if won?(@board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(@board)
      puts "Cat's Game!"
    end
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "O" || token == "X"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count(@board).even? ? "X" : "O"
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(@board, combo[0])
    end
  end

  def full?
    @board.all? do |full|
      full.include?("X") || full.include?("O")
    end
  end

  def draw?
  full?(@board) && !won?(@board)
  end

  def over?
    draw?(@board) || won?(@board)
  end

  def winner
    if win_combo = won?(@board)
      @board[win_combo.first]
    end
  end

end
