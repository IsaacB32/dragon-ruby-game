class InputHandle

    def initialize(a)
        @@args = a
        @@holding = false
    end

    def self.canMove
        @@holding ||= false
        if !@@holding && (isHolding @@args)
          @@holding = true
        elsif @@holding && !(isHolding @@args)
          @@holding = false
        end
    end

    def self.isHolding args
        (@@args.inputs.keyboard.key_held.up || @@args.inputs.keyboard.key_held.left || @@args.inputs.keyboard.key_held.right || @@args.inputs.keyboard.key_held.down)
    end
end