require 'app/Drawable.rb'

#class for any object that exists on the grid
class GridObject
  include Drawable

  def initialize(a, grid, scale, color, indexPosition = [0,0])
    @args = a
    @homeGrid = grid
    @size = scale
    @colorRGB = [color.x, color.y, color.z]

    @indexPos = indexPosition

    @quarterSize = [grid.getHalfSquareSize - scale.x.idiv(2), grid.getHalfSquareSize - scale.y.idiv(2)]

    @stationaryPosition = gridPosition
  end


  def draw
    raise "draw not implemented on GridObject"
  end

  def addToGridMatrix
    @homeGrid.setGridMatrix(@indexPos.x, @indexPos.y, self)
  end

  def gridPosition
    gridPositionCorner = @homeGrid.getPositionFromIndex(@indexPos.x, @indexPos.y)
    [gridPositionCorner[0] + @quarterSize.x, gridPositionCorner[1] + @quarterSize.y]
  end

  def checkGridBounds
    neighbors = @homeGrid.checkNeighbors(@indexPos)
    (neighbors).each do |n|
      
    end

    #CHECK END BOUNDS
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
      end
    #-----
end