class PriorityDrawer
    def initialize(thingsToDraw)
        @list = thingsToDraw
    end

    def addDrawableToList(drawable, priorityID)
        @list << { drawable: drawable, priority: priorityID }
        @list.sort_by { |item| -item[:priority] } # Sort in descending order
      end
    
      def drawScreen
        @list.each do |item|
          item.draw
        end
      end

      def debugClearAll
        @list = []
      end
end