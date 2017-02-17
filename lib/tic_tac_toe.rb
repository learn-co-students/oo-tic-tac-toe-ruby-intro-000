class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
  #CONSTRUCTOR---------------------------------------------------------------------
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  # Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    #binding.pry
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count { |el| el == "X" || el == "O"}
  end

  def current_player
    turn_count%2==0? "X" : "O"
  end

  def won?
      WIN_COMBINATIONS.each do |sub_arr|
        arr = [@board[sub_arr[0]],@board[sub_arr[1]],@board[sub_arr[2]]]
        if arr == ["X","X","X"] || arr == ["O","O","O"]
          return sub_arr
        end
      end
      return false
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def is_empty
    return @board.all? {|b| b == " " }
  end
  def is_draw
    return (@board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"] || @board == ["O", "X", "O", "X", "O", "O", "X", "O", "X"])
  end

  def draw?
    if is_draw && full?
      return true
    elsif won?
      return false
    elsif is_game_in_progress
      return false
    end
  end

  def over?
    if (draw?|| won?)
      return true
    elsif is_game_in_progress
      return false
    else
      return false
    end
  end

  def winner
      if won?
        @board[won?[0]]
      end
  end

  def is_game_in_progress
    if (@board.any?{ |i| i == " " || i == "  " })
      return true
    else
      return false
    end
  end

  def full?
    if is_draw
      return true
    elsif is_game_in_progress  #If atleast one spot is " "
      return false
    end
  end

  # Define your play method below
  def play
    while !over?
      turn
    end
    if won?
      w = winner
      puts "Congratulations #{w}!"
    elsif draw?
      puts "Cat's Game!"
      #puts "draw game"
    end
  end

end
