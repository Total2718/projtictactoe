

class Game()
  
  
    def initialization()
       
       @current_player = 1
       puts "Player 1, enter your name."
       @players[0] = gets.chomp
       puts "#{@players[0]}, you are player 1 and your symbol is X."
       puts "Player 2, enter your name."
       @players[1] = gets.chomp
       puts "#{@players[1]}, you are player 2 and your symbol is O."
       @symbols = [X, O]
       @game_over = false
       @player_one_spots = []
       @player_two_spots = []
       
       
       
       
       
    end
    
   
        
      
      
    end 
    
    def current_player_switch()
      if @current_player == 0 
        @current_player = 1
      elsif @current_player == 1 
        @current_player = 0
      end
    end
    
    def play_game()
      
      @board = Board.new
     

      @current_player = rand(0..1)
      while game_over == false do
        pick_spot

      end
      
      
      
      
      
      
    end

    def pick_spot()
        puts "@players"


    end
    
    
  end