require 'app/Drawable.rb'

#class for any object that exists on the grid
class GridObject
  include Drawable

  def initialize(a, grid, scale, color)
    @args = a
    @homeGrid = grid
    @indexPos = [0,0]
    @size = scale
    @colorRGB = [color.x, color.y, color.z]

    @position = gridPosition
  end

  def draw
    raise "not implemented in GridObject"
  end

  def gridPosition
    gridPositionCorner = @homeGrid.getPositionFromIndex(@indexPos.x,@indexPos.y)
  end
end