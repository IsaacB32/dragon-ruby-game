require 'app/InputHandle'

class PlayerObject < GridObject
    def initialize(a, grid, scale, color)
        super(a, grid, scale, color)
        @movement = [0,0]
    end

    def draw
        position = gridPosition()


        @args.outputs.solids << [
        position.x,
        position.y, 
        @size.x,@size.y,
        @colorRGB.x,@colorRGB.y,@colorRGB.z
        ]

        #@indexPosition = (calculateCharacterMovement)

        # args.outputs.solids << [
        # args.state.characterPosition.x,
        # args.state.characterPosition.y, 
        # getPlayerSize,getPlayerSize,
        # 255,0,0
        # ]
    end


    def calculateCharacterMovement
        #@position ||= getGridCenterForSprite(0,0, getHalfPlayerSize)
        if(canMove args)
        @movement.x += args.inputs.left_right
        @movement.y += args.inputs.up_down

        checkCharacterBounds @args
        #args.state.position = getGridCenterForSprite(args.state.movement.x, args.state.movement.y, getHalfPlayerSize)
        end
    end

    def checkCharacterBounds args
        #mins
        if @movement.x < 0
        @movement.x = 0
        end
        if @movement.y < 0
        @movement.y = 0
        end

        #maxs
        if @movement.x > getSquaresInGrid - 1
        @movement.x = getSquaresInGrid - 1
        end
        if @movement.y > getSquaresInGrid - 1
        @movement.y = getSquaresInGrid - 1
        end
    end
end