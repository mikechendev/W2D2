class Room
    attr_reader :capacity, :occupants
  
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @occupants.count >= @capacity
    end

    def available_space
        @capacity - @occupants.count
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            @occupants << name
            return true
        end
    end
    
end