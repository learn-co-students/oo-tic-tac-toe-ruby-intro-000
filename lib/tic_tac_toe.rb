class TicTacToe
  def initialize(board= nil)
    @board = board || Array.new(9," ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    index = input.to_i - 1
  end
  def move(input ,character="X")
    index = input_to_index(input)
    @board[index]= character
  end
  def position_taken?(index)
      if  @board[index]== "X" || @board[index]== "O"
      return true
    else
      return false
    end
  end
  def valid_move?(input)
    index = input_to_index(input)
    if (0..8).include?(index)
        if position_taken?(index)== true
        false
      else
        true
      end
    end
  end
  def turn
    puts "Please enter 1-9:"
    input= gets.chomp
    index= input_to_index(input)
    if valid_move?(input)== true
      move(input,current_player)
      display_board
    else
    turn
    end
  end
  def turn_count
    counter = 0
    @board.each do |place|
      if place=="X" || place=="O"
        counter +=1
      end
    end
      turn_count = counter
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]]==@board[win_combination[1]]&&@board[win_combination[0]]==@board[win_combination[2]]&&@board[win_combination[0]]!=" "
        return win_combination
      end
    end
    false
  end
  def full?
     all_full = @board.all? do |position|
       position !=" "
     end
   end
   def draw?
     full = full?
     if won?!= false  && full == false
       return false
     end
     if won? == false && full == true
       return true
     end
   end
    def over?
       if won? == true || full? == true
         return true
      end
   end
   def winner
     if won? == false
       return nil
     else
       win_combination = won?
         return @board[win_combination[0]]
       end
     end
  def play
    over = over?
    until  over == true
      if won?!= false || draw? == true
       break
      end
      turn
      over = over?
    end
    if won?!= false
      puts "Congratulations #{winner}!"
    end
    if draw? == true
      puts "Cats Game!"
    end
  end
end
