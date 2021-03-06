

class Board
    attr_reader :cells
    def initialize()

        @cells = [1, 2, 3, 4, 5, 6, 7, 8 ,9]

    end

    def current_display()

        puts <<-board
               |     |
            #{@cells[6]}  |  #{@cells[7]}  |  #{@cells[8]}
               |     |
            -------------
               |     | 
            #{@cells[3]}  |  #{@cells[4]}  |  #{@cells[5]}
               |     |    
            -------------
               |     |
            #{@cells[0]}  |  #{@cells[1]}  |  #{@cells[2]}

        board

    end 

    def change_display(number, symbol)
            
        @cells[number - 1] = symbol
        current_display

        
    end

end