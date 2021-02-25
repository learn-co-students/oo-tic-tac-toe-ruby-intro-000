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
    [6,4,2],
    [0,4,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |space|
      counter += 1 if space == "X" || space == "O"
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |wins|
      index_win_1 = wins[0]
      index_win_2 = wins[1]
      index_win_3 = wins[2]

      pos_1 = @board[index_win_1]
      pos_2 = @board[index_win_2]
      pos_3 = @board[index_win_3]

      if pos_1 == pos_2 && pos_2 == pos_3 && position_taken?(index_win_1)
        return wins
      end
    end
    return false
  end

  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end


end
