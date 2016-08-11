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
    [2, 4, 6]
  ]
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player)
    @board[position.to_i - 1] = current_player
  end

  def position_taken?(position)
    if
      @board[position.to_i] == "X" || @board[position.to_i] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(position)
      !position_taken?(position.to_i - 1) && position.to_i.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
      if !valid_move?(position)
      turn
      else
        move(position, current_player)
        display_board
      end
  end

  def turn_count
    number_of_turns = 0
    @board.each do |turns|
      if turns == "X" || turns == "O"
      number_of_turns += 1
      end
    end
    return number_of_turns
  end

  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
  end

  def won?
        if WIN_COMBINATIONS.each do |win_combination|

          position_1 = @board[win_combination[0]]
          position_2 = @board[win_combination[1]]
          position_3 = @board[win_combination[2]]

          if
            position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination
          elsif
            position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
          end
        end
        else
          return false
        end
    end

    def full?
      @board.all? do |play|
        play == "X" || play == "O"
      end
    end

    def draw?
      if !won? && full?
        return true
      else
        return false
      end
    end

    def over?
      full? || won? || draw?
    end

    def winner
        if won?
          win_combination = won?
          return @board[win_combination[0]]
      end
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
