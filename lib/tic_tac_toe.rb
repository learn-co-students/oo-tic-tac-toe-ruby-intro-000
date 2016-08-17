class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8]
  ]

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    row_length = 3
    for i in 0..@board.length - 1
      print " " + @board[i].to_s + " "
      remainder = (i + 1) % row_length
      if remainder > 0 and i < @board.length - 1
        print "|"
      end

      if remainder == 0 and i < @board.length - 1
        print "\n-----------\n"
      end
    end
    print "\n"
  end

  def input_to_index(index)
    index = index.to_i
    return index
  end

  def move(position, character)
    @board[position - 1] = character
  end

  def position_taken?(index)
    if @board.length <= index
      return true
    end

    element = @board[index]
    case element
    when "X", "O"
      return true
    end

    return false
  end

  def valid_move?(index)
    index = index.to_i - 1
    if index < 0 or index >= @board.length
      return false
    end
    return !position_taken?(index)
  end

  def get_index()
    puts "Please enter 1-9:"
    input = gets.strip
    return input_to_index(input)
  end

  def turn_count()
    taken = @board.select do |el|
      el == 'X' || el == 'O'
    end

    return taken.length
  end

  def current_player()
    count_x = 0
    count_o = 0

    for i in 0...@board.length
      case @board[i]
      when "X"
        count_x += 1
      when "O"
        count_o += 1
      end
    end

    if count_x > count_o
      return "O"
    end
    if count_x < count_o
      return "X"
    end
    if count_x == count_o
      return "X"
    end
  end

  def turn()
    index = get_index()

    until valid_move?(index)
      index = get_index()
    end

    move(index, current_player)

    display_board()
  end

  def won?()
    if @board.length == 0
      return false
    end

    winners = WIN_COMBINATIONS.select do |comb|
      comb.all? {|i| @board[i] == "X"} or comb.all? {|i| @board[i] == "O"}
    end

    if winners.length > 0
      return winners[0]
    end
    return false
  end

  def full?()
    return @board.all? {|ch| ch == "X" or ch == "O"}
  end

  def draw?()
    if won?()
      return false
    else
      return full?()
    end
  end

  def over?()
    return won?() || draw?()
  end

  def winner()
    won = won?()
    if won
      return @board[won?()[0]]
    end
  end

  def play()
    while !over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    end

    if draw?()
      puts "Cats Game!"
    end
  end
end
