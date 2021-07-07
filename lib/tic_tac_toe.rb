class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-------------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-------------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, player_token)
    @board[position] = player_token
  end

  def position_taken?(position)
  !(@board[position] == " ")
  end

  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    @board.count { |pos| pos != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please choose a position 1-9:"
    user_input = gets.strip
    converted = input_to_index(user_input)
    player_token = current_player

    until valid_move?(converted)
      puts "Please choose a position 1-9:"
      player_input = gets.strip
      converted = input_to_index(player_input)
    end

    move(converted, player_token)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |winn_combo|
        if @board[winn_combo[0]] == "X" && @board[winn_combo[1]] == "X" && @board[winn_combo[2]] == "X"
            return winn_combo
        elsif @board[winn_combo[0]] == "O" && @board[winn_combo[1]] == "O" && @board[winn_combo[2]] == "O"
            return winn_combo
        end
    end

    false
  end

  def full?
    @board.none? { |pos| pos == " " }
  end

  def draw?
    if full? && !won?
        return true
    elsif !won?
        return false
    elsif won?
        return false
    end
  end

  def over?
    if won? || full? || draw?
        return true
    else
        false
    end
  end

  def winner
    !won? ? nil : @board[won?[0]]
  end

  def play
    until over?
        turn
    end

    if winner == nil
        puts "Cat's Game!"
    else
        puts "Congratulations #{winner}!"
    end
  end
end
