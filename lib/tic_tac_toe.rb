class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
  [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i - 1)

    return index
  end

  def move(index, current_player)
    index = index - 1
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    elsif @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(position)

    position = position.to_i - 1
    if position_taken?(position) || (position > 8) || (position < 0)
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"

    input = gets.strip

    index = input_to_index(input)

    if valid_move?(input)
      move(input_to_index(index), current_player)
    else
      turn
    end

    display_board
  end

  def turn_count
    counter = 0

    @board.each do |square|
      if (square == "X") || (square == "O")
        counter += 1
      end
    end

    return counter
  end

  def current_player
    character = nil
    if turn_count % 2 == 0
      character = "X"
    elsif turn_count % 2 == 1
      character = "O"
    end
    return character
  end

  def won?
    WIN_COMBINATIONS.each do |position|
      if (@board[position[0]] == "X") && (@board[position[1]] == "X") && (@board[position[2]] == "X")
        return position
      elsif (@board[position[0]] == "O") && (@board[position[1]] == "O") && (@board[position[2]] == "O")
        return position
      end
    end
    return false
  end

  def full?
    if @board.all? do |spot|
      (spot != " ") && (spot != "")
      end
      return true
    else
      return false
    end
  end

  def draw?
    if !(won?) && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    winner = nil
    if won?
      WIN_COMBINATIONS.each do |position|
        if (@board[position[0]] == "X") && (@board[position[1]] == "X") && (@board[position[2]] == "X")
          winner = "X"
        elsif (@board[position[0]] == "O") && (@board[position[1]] == "O") && (@board[position[2]] == "O")
          winner = "O"
        end
      end
    end

      return winner
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
