class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, player="X")
    @board[index - 1] = player
    @board
  end

  # def input_to_index(user_input)
  #   user_input.to_i - 1
  # end

  def position_taken?(index)
    index = index.to_i
    @board[index] == ' ' || @board[index] == '' || @board[index] == nil ? false : true
  end

  def valid_move?(index)
    index = index.to_i
    if position_taken?(index-1)
      return false
    elsif index < 1 || index > 9
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    puts "Where would you like to go?"
    index = gets.strip
    # index = input_to_index(input)

    until valid_move?(index)
      puts "Please enter 1-9:"
      puts "Where would you like to go?"
      index = gets.strip
      # index = input_to_index(input)
    end
    player = current_player
    index = index.to_i
    move(index, player)
    display_board
  end

  def turn_count
    filled_positions = @board.select {|pos| pos == "X" || pos == "O"}
    number_filled = filled_positions.length
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      pos_1 = win_combo[0]
      pos_2 = win_combo[1]
      pos_3 = win_combo[2]

      position_1 = @board[pos_1]
      position_2 = @board[pos_2]
      position_3 = @board[pos_3]

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combo
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combo
      end
    end
    false
  end

  def full?
    @board.all? {|position| position == "X" || position =="O"}
  end

  def draw?
    won? || !full? ? false : true
  end

  def over?
    won? || full? || draw? ? true : false
  end

  def winner
    if won?
      win_combo = won?
      position = win_combo[0]
      @board[position]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
