class WallObject < GridObject
    def drawOnGrid
      @args.outputs.solids << [@position.x, @position.y, @size.x, @size.y, @colorR, @colorG, @colorB]
    end
  end