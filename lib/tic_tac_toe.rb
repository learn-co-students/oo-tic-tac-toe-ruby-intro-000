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
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts ("-----------")
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts ("-----------")
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(input)
    user_input = input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8) ? true : false
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Choose a number 1-9: "
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "That position is already taken"
      turn
    end
  end

  def won?
    for win_combination in WIN_COMBINATIONS
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    draw? || won?
  end

  def winner
    player_token = won?

    if !won?
      return nil
    end

    if @board[player_token[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
