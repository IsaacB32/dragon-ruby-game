require 'app/PriorityDrawer.rb'
require 'app/Grid.rb'
require 'app/GridObject.rb'
require 'app/Player.rb'
require 'app/WallObject.rb'

#SCREEN SIZE
# 1280x720 pixels
  def getWidth
    1280
  end
  def getHeight
    720
  end
#-----

def tick args
  args.state.drawer = PriorityDrawer.new()
  args.state.origin ||= [getWidth.div(2), getHeight.div(2)]
  ##GRID
  (drawGrid args)
  ##PLAYER
  (drawPlayer args)

  args.state.wall1 ||= WallObject.new(args, args.state.grid, [30,30], [0,0,0], [1,1])
  args.state.drawer.addDrawableToList(args.state.wall1, 3)

  args.state.drawer.drawScreen
end

def drawGrid args
  args.state.grid = Grid.new(args, args.state.origin, 10,10, 30)
  args.state.drawer.addDrawableToList(args.state.grid, 1)
end

def drawPlayer args
  args.state.player ||= PlayerObject.new(args, args.state.grid, [20,20], [255,0,0])
  args.state.drawer.addDrawableToList(args.state.player, 2)
end

  def resetCharacterMovement args
    args.state.movement = [0,0]
    args.state.position = getGridCenterForSprite(0,0, getHalfPlayerSize)
  end
##--##