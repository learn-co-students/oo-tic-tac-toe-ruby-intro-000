class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(user_input, player)
    @board[user_input.to_i-1] = player
  end

  def position_taken?(index)
    if @board[index.to_i] == " " ||
       @board[index.to_i] == "" ||
       @board[index.to_i] == nil
      return false
    else
      return true
    end
  end

  def valid_move? (user_input)
    index_board = user_input.to_i - 1
    if user_input.to_i.between?(1,9) && !position_taken?(index_board)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    #index = input_to_index(user_input)
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0;
    @board.each do |character|
      if character == "X" || character == "O"
        count+=1
      end
    end

    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    matches = []

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0].to_i
      win_index_2 = win_combination[1].to_i
      win_index_3 = win_combination[2].to_i

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
        #matches<<win_combination
      else
        matches = nil
      end
    end

    return matches
  end

  def full?
    @board.each do |element|
      if element == " "
        return false
      end
    end
    return true
  end

  def draw?
      !won? && full?
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    token = nil

    winner_player = won?

    if winner_player
      if winner_player.class == Array
        position = winner_player[0]
        token = @board[position]
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

  def input_to_index (user_input)
    user_input = user_input.to_i
    user_input = user_input-1
  end

end
