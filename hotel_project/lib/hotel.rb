require_relative "room"

class Hotel
    attr_reader :rooms
  
    def initialize(name, room_names)
        @name = name
        @rooms = {}
        room_names.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        arr = []
        @name.split.each { |word| arr << word.capitalize }
        arr.join(' ')
    end

    def room_exists?(room)
        @rooms.keys.include?(room)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        else
            p 'sorry, room is full'
        end
    end

    def has_vacancy?
        @rooms.any? { |k,v| !v.full? }
    end

    def list_rooms
        @rooms.each do |k,v|
            puts "#{k} #{v.available_space}"
        end
    end
end
