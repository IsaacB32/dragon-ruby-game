require 'app/InputHandle'

class PlayerObject < GridObject
    def initialize(a, grid, scale, color)
        super(a, grid, scale, color)
        @movement = [0,0]
    end

    def draw
        #set position
        @indexPos = @movement
        screenPosition = (gridPosition)
        #draw
        @args.outputs.solids << [ screenPosition.x, screenPosition.y, @size.x, @size.y, @colorRGB.x,@colorRGB.y,@colorRGB.z]
        #move
        (calculateCharacterMovement)
    end


    def calculateCharacterMovement
        if(InputHandle.canMove? @args)
            @movement.x += @args.inputs.left_right
            @movement.y += @args.inputs.up_down

            (checkGridBounds)
        end
    end
end