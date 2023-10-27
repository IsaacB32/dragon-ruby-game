class PriorityDrawer
    def initialize()
        @list = []
    end

    def addDrawableToList(drawable, priorityID)
        @list << { drawable: drawable, priority: priorityID }
        @list.sort_by { |item| -item[:priority] } # Sort in descending order
      end
    
      def drawScreen
        @list.each do |item|
          item[:drawable].draw
        end
      end
end