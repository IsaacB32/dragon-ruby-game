class InputHandle

    @@holding = false

    def self.canMove? args
        ableToMove = false
        isBeingHeldDown = (InputHandle.isHolding? args)
        if !@@holding && isBeingHeldDown
            @@holding = true
            ableToMove = true
        elsif @@holding && isBeingHeldDown
            ableToMove = false
        elsif !isBeingHeldDown
            ableToMove = false
            @@holding = false
        end
        ableToMove

        # holding and !past = (canMove) true
        # holding and past = (canMove) false
        # !holding and past = (canMove) false, (past) false
        # !holding and !past = (canMove) false, (past) false
    end

    def self.isHolding? args
        (args.inputs.keyboard.key_held.up || args.inputs.keyboard.key_held.left || args.inputs.keyboard.key_held.right || args.inputs.keyboard.key_held.down)
    end

    def self.endMovement
        @@holding = false
    end
end