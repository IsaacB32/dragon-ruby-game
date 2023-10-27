class Grid 
    def initialize(a, centerLocation, xSquareNumber, ySquareNumber, sizeOfSquare)
        super(1)
        @args = a
        @center = centerLocation
        @xSquares = xSquareNumber
        @ySquares = ySquareNumber
        @squareSize = sizeOfSquare

        @gridSize = [@xSquares * @squareSize, @ySquares * @squareSize]
        @gridCorner = [@center.x - @gridSize[0].idiv(2), @center.y - @gridSize[1].idiv(2)]
    end

    def draw()
        #@args.outputs.solids << [@gridCorner.x, @gridCorner.y, 5,5, 255,0,0]
        (@xSquares+1).times do |i|
            @args.outputs.lines << [
                @gridCorner[0] + i * @squareSize, @gridCorner[1], 
                @gridCorner[0] + i * @squareSize, @gridCorner[1] + @gridSize[1]
            ]
        end

        (@ySquares+1).times do |i|
            @args.outputs.lines << [
                @gridCorner[0], @gridCorner[1] + i * @squareSize, 
                @gridCorner[0] + @gridSize[0], @gridCorner[1] + i * @squareSize
            ]
        end
    end

    def getPositionFromIndex(x,y)
        squareIndex = [@squareSize * x, @squareSize * y]
        [@gridCorner.x + squareIndex.x, @gridCorner.y + squareIndex.y]
    end
end