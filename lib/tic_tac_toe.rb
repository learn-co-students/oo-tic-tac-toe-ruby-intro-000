class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board
    row_separator = "-----------"
    element_separator = "|"

    @board.each_with_index do |element, index|
      print " #{@board[index]} "
      temp_index = index+1
      if (temp_index % 3 != 0)
        print element_separator
      else
        puts ""
        puts row_separator unless index == @board.length-1
      end
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, user_type)
    @board[index] = user_type
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,9)
  end

  def turn_count
    @board.select{ |element| element == "X" || element == "O"}.count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def get_user_input
    puts "Please enter 1-9:"
    position = gets.strip
    index = input_to_index(position)
  end

  def turn
    index = get_user_input
    if valid_move?(index)
      move(index, current_player)
      display_board
      index += 1
    else
      turn
    end
    index
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      if (@board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3]) && (@board[win_index_1] == 'X' || @board[win_index_1] == 'O')
        return win_combination
      end
    end
    return false
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      win_combination = won?
      @board[win_combination[0]]
    end
  end

  def full?
    @board.all? {|element| element == "X" || element == "O"}
  end

  def play
    success_index = 0
    while success_index < 9 && !over?
      success_index = turn + 1
    end

    if over?
      if draw?
        puts "Cat's Game!"
      end
      if won?
        puts "Congratulations #{winner}!"
      end
    end
  end

end
