#class for any object that exists on the grid
class GridObject
    def initialize(a, indexPos, scale, color)
      @args = a
      @indexPosition = indexPos
      @size = scale
      @colorR = color.x
      @colorG = color.y
      @colorB = color.z
  
      @position = findPositionOnGrid
    end
  
    def findPositionOnGrid
      center = zeroLocationCenter
  
      squareIndex = [getSquareSize * @indexPosition.x, getSquareSize * @indexPosition.y]
      [center.x + squareIndex.x - @size.x.idiv(2), center.y + squareIndex.y - @size.y.idiv(2)]
    end
  end