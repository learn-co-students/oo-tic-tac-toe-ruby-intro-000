class TicTacToe

  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
                        [0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8],
                        [0, 3, 6],
                        [1, 4, 7],
                        [2, 5, 8],
                        [2, 4, 6],
                        [0, 4, 8]
                     ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(input, token = "X")
    token = current_player
    index = input.to_i - 1
    @board[index] = token
  end

  def position_taken?(index)
    (@board[index.to_i].nil? || @board[index.to_i] != " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    if valid_move?(input)
      move(input)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each {|position| counter += 1 if position != " "}
    return counter
  end

  def current_player
    x_or_o = turn_count % 2 == 0 ? "X" : "O"
    return x_or_o
  end

  def won?

    WIN_COMBINATIONS.each do |sub_array|
      combination = []
      x_o_array = []

      sub_array.each do |sub_array_element|

        combination << sub_array_element
        x_o_array << @board[sub_array_element]

      end
        #spec file says to return true in a win, website says array, removed cobination
        #return combination if x_o_array == ["X", "X", "X"] || x_o_array == ["O", "O", "O"]
        return combination if x_o_array == ["X", "X", "X"] || x_o_array == ["O", "O", "O"]

    end

    return false

  end

  def full?
    @board.each{|token| return false if token == " "}
    return true
  end

  def draw?
    return true if !won? && full?
    return false
  end

  def over?
    return true if won? || draw?|| full?
  end

  def winner
    return nil if won? == false

    x_or_o = @board[won?.first]

    return x_or_o
  end

  def play

    counter = 0

    until counter == 9
      break if over?
      turn
      counter += 1
    end

    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?

  end

end
