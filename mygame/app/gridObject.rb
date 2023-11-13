
#class for any object that exists on the grid
class GridObject
  def initialize(a, grid, scale, color, indexPosition = [0,0], isMoveable = false)
    @args = a
    @homeGrid = grid
    @size = scale
    @colorRGB = [color.x, color.y, color.z]

    @indexPos = indexPosition

    @quarterSize = [grid.getHalfSquareSize - scale.x.idiv(2), grid.getHalfSquareSize - scale.y.idiv(2)]
    @stationaryPosition = gridPosition

    @moveable = isMoveable

    #@homeGrid.setGridMatrix(@indexPos, self)
  end

  def draw
    #@homeGrid.setGridMatrix(@indexPos, self)
  end

  def gridPosition
    gridPositionCorner = @homeGrid.getPositionFromIndex(@indexPos.x, @indexPos.y)
    [gridPositionCorner[0] + @quarterSize.x, gridPositionCorner[1] + @quarterSize.y]
  end

  def checkGridBounds

    containedObject = @homeGrid.getObjectGridMatrix(@indexPos)

    #mins
    if @indexPos.x < 0
        @indexPos.x = 0
    end
    if @indexPos.y < 0
        @indexPos.y = 0
    end

    #maxs
    if @indexPos.x > @homeGrid.getSquaresInGridX - 1
        @indexPos.x = @homeGrid.getSquaresInGridX - 1
    end
    if @indexPos.y > @homeGrid.getSquaresInGridY - 1
        @indexPos.y = @homeGrid.getSquaresInGridY - 1
    end
    containedObject
  end
end