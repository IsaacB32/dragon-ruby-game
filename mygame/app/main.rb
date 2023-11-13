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
  args.state.origin ||= [getWidth.div(2), getHeight.div(2)]
  ##GRID
  args.state.grid = Grid.new(args, args.state.origin, 15,10, 30)
  ##PLAYER
  args.state.player ||= PlayerObject.new(args, args.state.grid, [20,20], [255,0,0])
  
  args.state.wall1 = WallObject.new(args, args.state.grid, [30,30], [0,0,0], [1,1])
  
  drawList = [args.state.grid,args.state.player, args.state.wall1] #, 
  args.state.drawer = PriorityDrawer.new(drawList)
  (args.state.drawer.drawScreen)
  (args.state.drawer.debugClearAll)
end