class GuessingGame

    attr_reader :num_attempts

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        case num <=> @secret_num
        when -1
            p 'too small'
        when 0
            p 'you win'
            @game_over = true
        when 1
            p 'too big'
        end
        @num_attempts += 1
    end

    def ask_user
        p 'enter a number'
        response = gets.chomp.to_i
        self.check_num(response)
    end

end
