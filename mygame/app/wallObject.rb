class WallObject < GridObject
    def initialize(a, grid, scale, color, indexPosition)
      super(a,grid,scale,color, indexPosition)
    end

    def draw
      @args.outputs.solids << [ @stationaryPosition.x, @stationaryPosition.y, @size.x, @size.y, @colorRGB.x,@colorRGB.y,@colorRGB.z]
    end
end