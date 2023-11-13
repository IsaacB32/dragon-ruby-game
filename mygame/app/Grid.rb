class Grid 
    def initialize(a, centerLocation, xSquareNumber, ySquareNumber, sizeOfSquare)    
        @args = a 
        @center = centerLocation
        @xSquares = xSquareNumber
        @ySquares = ySquareNumber
        @squareSize = sizeOfSquare

        @gridSize = [@xSquares * @squareSize, @ySquares * @squareSize]
        @gridCorner = [@center.x - @gridSize[0].idiv(2), @center.y - @gridSize[1].idiv(2)]

        @gridMatrix = Array.new(@xSquares) { Array.new(@ySquares) { nil } }
    end

    def draw()
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

    def setGridMatrix(index,object)
        @gridMatrix[index.x,index.y] = object
    end
    def getObjectGridMatrix(index)
        @gridMatrix[index.x,index.y]
    end

    def clearGridMatrix()
        @gridMatrix = [[]]
    end

    #GET
        def getSquaresInGridX
            @xSquares
        end
        def getSquaresInGridY
            @ySquares
        end

        def getHalfSquareSize
            @squareSize.idiv(2)
        end
    #----
end