class Grid 
    def initialize(a, centerLocation, xSquareNumber, ySquareNumber, sizeOfSquare)
        #you removed this:         super(1)
        
        @args = a 
        @center = centerLocation
        @xSquares = xSquareNumber
        @ySquares = ySquareNumber
        @squareSize = sizeOfSquare

        @gridSize = [@xSquares * @squareSize, @ySquares * @squareSize]
        @gridCorner = [@center.x - @gridSize[0].idiv(2), @center.y - @gridSize[1].idiv(2)]

        @gridMatrix = [[]]
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

        #CLEAR GRID MATRIX
        @gridMatrix = [[]]
    end

    def getPositionFromIndex(x,y)
        squareIndex = [@squareSize * x, @squareSize * y]
        [@gridCorner.x + squareIndex.x, @gridCorner.y + squareIndex.y]
    end

    def setGridMatrix(x,y,object)
        @gridMatrix[x,y] = object
    end
    def checkNeighbors(position)
        x = position.x
        y = position.y
        
        neighborIndex = [[x,y+1],[x,y-1], [x-1, y],[x+1, y]] #up, down, left,right 
        neighbors = []
        i = 0
        (neighborIndex).each do |value|
            neighbors[i] = getObjectGridMatrix(value)
            i = i + 1
        end
        #return the neighbors to check
        neighbors
    end
    def getObjectGridMatrix(index)
        @gridMatrix[index.x, index.y]
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