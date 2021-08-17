

class Game
    #possible winning sequences
  $winning_sequences = [[7, 8, 9], [4, 5, 6], [1, 2, 3], 
                       [1, 4, 7], [2, 5, 8], [3, 6, 9], 
                      [7, 5, 3], [1, 5, 9]]
    
    def player_names()
        @players = []
        puts "Player 1, enter your name."
       @players[0] = gets.chomp
       puts "#{@players[0]}, you are player 1 and your symbol is X."
       puts "Player 2, enter your name."
       @players[1] = gets.chomp
       puts "#{@players[1]}, you are player 2 and your symbol is O." 
    end

    def initialize()
       
       @current_player = 1
        player_names
       @symbols = ["X", "O"]
       #a flag for when no more moves are possible or one of the winning 
       #sequences has been matched
       @game_over = false
       #these two store the spots they've chosen and are used to check for a win
       @player_one_spots = []
       @player_two_spots = []
       #keeps track of the number of moves total since there is a finite number
       # of moves and it's possible to not have a winner
       @mark_counter = 0
       
       
       
       
    end
    
   
        
      
      
   
    #switches player based on whose turn it is currently
    def current_player_switch()
      if @current_player == 0 
        @current_player = 1
      elsif @current_player == 1 
        @current_player = 0
      end
    end
    
    def play_game()
        
      @game_over = false
      @player_one_spots = []
      @player_two_spots = []
      @mark_counter = 0
      @board = Board.new
      @board.current_display
     

      @current_player = rand(0..1)

      while @game_over == false do
        pick_spot


      end
      
      
      
      
      
      
      
    end

    def pick_spot()
        spot_picked = false
        possible_picks = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        #keeps looping until the player enters an integer 1 through 9
        puts "#{@players[@current_player]}, please select a spot to mark an #{@symbols[@current_player]} by entering the corresponding number."
        while spot_picked == false
            player_pick = gets.chomp
            if possible_picks.any?{|integer| integer == player_pick}
            player_pick = player_pick.to_i
            end
            
            if player_pick.is_a?(Integer) == false
                puts " Please select an integer."
            elsif @board.cells[player_pick - 1] == "X" || @board.cells[player_pick - 1] == "O"
                #the above checks if the spot has already been chosen 
                puts "Please choose a different spot. That one is already chosen."
            else 
                puts "Excellent choice."
                @board.change_display(player_pick, @symbols[@current_player])
                spot_picked = true
                @mark_counter +=1
                
                #upon a valid spot input, the spot number is added to the player
                #spot list before checking to see if they've won
                if @current_player == 0
                    @player_one_spots.append(player_pick)
                elsif @current_player == 1
                    @player_two_spots.append(player_pick)
                end
                check_game_over
            end

            
            
        end
        current_player_switch

    end

    def check_game_over()
        #this checks to see if any of the winning sequences is included in either
        #of the player spot lists
        if $winning_sequences.any? {|win| (win - @player_one_spots).empty? == true} || 
            $winning_sequences.any?{|win| (win - @player_two_spots).empty? == true}
            
            @game_over = true
            puts "Congratulations #{@players[@current_player]}, you have won this game of Tic Tac Toe! "
        elsif @mark_counter >= 9
            @game_over = true
            puts "There are no spots left and neither of you have won."
        end

        if @game_over == true
            play_again
        end
    end


    def play_again()
        puts "Would you like to play again? Yes or No"
        player_response = gets.chomp

        if player_response == "No"
            puts "Have a great day!"

        elsif player_response == "Yes"
            puts "Let's begin then!"
            play_game()
        end
    end
    

    
    
  end


  