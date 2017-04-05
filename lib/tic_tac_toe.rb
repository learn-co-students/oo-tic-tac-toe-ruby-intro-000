class TicTacToe

  def initialize
    @board = @board || Array.new(9, " ")
  end

  # OR
  # def initialize (board = nil)
  #   @board = board || Array.new(9, " ")
  # end

  #Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

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

  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    # For Rake need to add STDIN. before gets!
    # input = STDIN.gets.strip
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  # OR
  # def turn_count
  #   turn_count=0
  #     @board.each do |entry|
  #       if (entry == "X" || entry =="O")
  #         turn_count+=1
  #       end
  #     end
  #   return turn_count
  # end
  #
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
      WIN_COMBINATIONS.each do |win|
          board_win = []
          win_index_1 = win[0]
          position_1 = @board[win_index_1]
          win_index_2 = win[1]
          position_2 = @board[win_index_2]
          win_index_3 = win[2]
          position_3 = @board[win_index_3]

           if ( position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" )
             board_win.push(win_index_1, win_index_2, win_index_3)
             return board_win
           end
      end
    false
  end

  # def full?
  #   @board.all? do |pos|
  #   	pos == "X" || pos == "O"
  #   end
  # end

  # More concise as above
  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
  end

  def draw?
      !won? && full?
  end

  def over?
    # won? == true || full? == true || draw? == true
    won? || draw?
  end

  def winner
    WIN_COMBINATIONS.each do |win|
        win_index_1 = win[0]
        position_1 = @board[win_index_1]
        win_index_2 = win[1]
        position_2 = @board[win_index_2]
        win_index_3 = win[2]
        position_3 = @board[win_index_3]

        if ( position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" )
          return position_1
        end
    end
    nil
  end

  def play
      until over? do
        turn
      end

      if won?
        winner == "X" ? winner_token="X" : winner_token="O"
        puts "Congratulations #{winner_token}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end

end

#new_game = TicTacToe.new
#new_game.display_board
