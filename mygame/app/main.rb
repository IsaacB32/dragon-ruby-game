require 'app/Grid.rb'
require 'app/GridObject.rb'
require 'app/Player.rb'
require 'app/PriorityDrawer.rb'

#SCREEN SIZE
# 1280x720 pixels
  def getWidth
    1280
  end
  def getHeight
    720
  end
#-----

def canMove args
  args.state.holding ||= false
  if !args.state.holding && (isHolding args)
    args.state.holding = true
  elsif args.state.holding && !(isHolding args)
    args.state.holding = false
  end
end

def isHolding args
  (args.inputs.keyboard.key_held.up || args.inputs.keyboard.key_held.left || args.inputs.keyboard.key_held.right || args.inputs.keyboard.key_held.down)
end

#GRID
  def getGridSize
    getSquaresInGrid * getSquareSize
  end

  def getSquaresInGrid
    20
  end

  def getSquareSize
    30
  end

  #GRID-BOUNDS
    def zeroLocation
      [getWidth.idiv(2) - getGridSize.idiv(2), getHeight.idiv(2) - getGridSize.idiv(2)] 
    end

    def zeroLocationCenter
      zero = zeroLocation
      [zero.x + getSquareSize.idiv(2), zero.y + getSquareSize.idiv(2)]
    end

    def getZeroCorner
      zeroLocation
    end
    def getMaxCorner
      [zeroLocation.x + getGridSize, zeroLocation.y + getGridSize]
    end
  #--

#----

#PLAYER
  def getPlayerSize
    20
  end
  def getHalfPlayerSize
    [getPlayerSize.idiv(2), getPlayerSize.idiv(2)]
  end
#----



def tick args
  args.state.drawer = PriorityDrawer.new()
  args.state.origin ||= [getWidth.div(2), getHeight.div(2)]
  ##GRID
  args.state.grid ||= Grid.new(args, args.state.origin, 10,10, 30)
  args.state.drawer.addDrawableToList(args.state.grid, 1)
  ##PLAYER
  args.state.player = PlayerObject.new(args, args.state.grid, [20,20], [255,0,0])
  args.state.drawer.addDrawableToList(args.state.player, 2)


  args.state.drawer.drawScreen
  # drawCharater args
  # drawGrid args

  # args.outputs.solids << [100,500,10,10,255,0,0]

  # drawWalls args

  # reset args
end

#WALLS##
  def drawWalls args
    (8).times do |i|
      wall = WallObject.new(args, [i,8],[getSquareSize,getSquareSize],[0,0,0])
      wall.drawOnGrid
     # drawWall(args, i, 4)
    end
  end

  def drawWall args, x, y
    position = getGridCenterForSprite(x,y, [getSquareSize.idiv(2), getSquareSize.idiv(2)])
    args.outputs.solids << [position.x, position.y, getSquareSize, getSquareSize, 0,0,0];
  end
##--##


##PLAYER##
  def drawCharater args   
    args.state.characterPosition = (calculateCharacterMovement args)

    args.outputs.solids << [
      args.state.characterPosition.x,
      args.state.characterPosition.y, 
      getPlayerSize,getPlayerSize,
      255,0,0
    ]
  end

  def calculateCharacterMovement args
    args.state.movement ||= [0,0]
    args.state.position ||= getGridCenterForSprite(0,0, getHalfPlayerSize)
    if(canMove args)
      args.state.movement.x += args.inputs.left_right
      args.state.movement.y += args.inputs.up_down

      checkCharacterBounds args
      args.state.position = getGridCenterForSprite(args.state.movement.x, args.state.movement.y, getHalfPlayerSize)
    end
    args.state.position
  end

  def checkCharacterBounds args
    #mins
    if args.state.movement.x < 0
      args.state.movement.x = 0
    end
    if args.state.movement.y < 0
      args.state.movement.y = 0
    end

    #maxs
    if args.state.movement.x > getSquaresInGrid - 1
      args.state.movement.x = getSquaresInGrid - 1
    end
    if args.state.movement.y > getSquaresInGrid - 1
      args.state.movement.y = getSquaresInGrid - 1
    end
  end

  def resetCharacterMovement args
    args.state.movement = [0,0]
    args.state.position = getGridCenterForSprite(0,0, getHalfPlayerSize)
  end
##--##

##GRID##
  # def drawGrid args
  #   args.state.origin ||= [getWidth.div(2) - (getGridSize).div(2), getHeight.div(2) - (getGridSize).div(2)]
  #   squareSize ||= getSquareSize

  #   (getSquaresInGrid + 1).times do |i|
  #     args.outputs.lines << [
  #       args.state.origin.x + i * squareSize, 
  #       args.state.origin.y, 
  #       args.state.origin.x + i * squareSize, 
  #       getHeight - args.state.origin.y
  #     ]
  #   end

  #   (getSquaresInGrid + 1).times do |i|
  #     args.outputs.lines << [
  #       args.state.origin.x, 
  #       args.state.origin.y + i * squareSize, 
  #       getWidth - args.state.origin.x, 
  #       args.state.origin.y + i * squareSize
  #     ] 
  #   end
  # end

  # def getGridLocation(x,y)
  #   center = zeroLocationCenter

  #   squareIndex = [getSquareSize * x, getSquareSize * y]
  #   [center.x + squareIndex.x, center.y + squareIndex.y]
  # end

  # def getGridCenterForSprite(x,y, halfSpriteSize)
  #   position = getGridLocation(x, y)
  #   [position.x - halfSpriteSize.x, position.y - halfSpriteSize.y]
  # end
##--##

def reset args
  if args.inputs.keyboard.r
    resetCharacterMovement args
  end
end
  
def debug(args, label)
  args.outputs.labels << [50,50,"#{label}", 255,0,0]
end