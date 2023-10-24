class Grid
    def initialize(a, centerLocation, xSquareNumber, ySquareNumber, sizeOfSquare)
        @args = a
        @center = centerLocation
        @xSquares = xSquareNumber
        @ySquares = ySquareNumber
        @squareSize = sizeOfSquare
    end

    def draw()
        (@xSquares + 1).times do |i|
            @args.outputs.lines << [
              @center.x + i * @squareSize, 
              @center.y, 
              @center.x + i * @squareSize, 
              getHeight - @center.y
            ]
        end
      
          (getSquaresInGrid + 1).times do |i|
            args.outputs.lines << [
              args.state.origin.x, 
              args.state.origin.y + i * squareSize, 
              getWidth - args.state.origin.x, 
              args.state.origin.y + i * squareSize
            ] 
        end
    end
end