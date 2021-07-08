require "pry"
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

   def input_to_index(user_input)
     user_input.to_i - 1
   end

   def move(index, token = "X")
     @board[index] = token
   end

   def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
   end

   def valid_move?(index)
     if index.between?(0, 8)
        if !(position_taken?(index))
          true
        else
          false
        end
      else
        false
      end
    end

    def turn_count
      turn_counter = 0
      @board.each do |space|
        if space == "X" || space =="O"
          turn_counter += 1
        end
      end
        turn_counter
      end

      def current_player
        turn_count.even? ? "X" : "O"
      end

        def turn
          puts "Please enter 1-9:"
          user_input = gets.strip
          index = input_to_index(user_input)
          if valid_move?(index)
            move(index, current_player)
            display_board
          else
            turn
          end
        end

        def won?
            WIN_COMBINATIONS.detect do |win_combination|
              @board[win_combination[0]] == @board[win_combination[1]] &&
              @board[win_combination[1]] == @board[win_combination[2]] &&
              position_taken?(win_combination[0])
            end
          end

          def full?
            @board.none? do |index|
              index == nil || index == " "
            end
          end

          def draw?
            if !won? && full?
              true
            end
          end

        def over?
            if won? || full? || draw?
            true
          end
        end


          def winner
            if won?
              @board[won?[0]]
            end
          end


          def play
            until over?
              turn
            end
            # won? ? puts "Congratulations #{winner}!" : puts "Cat's Game!"
            if won?
              puts "Congratulations #{winner}!"
            elsif draw?
              puts "Cat's Game!"
            end
          end


        end
