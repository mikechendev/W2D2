class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  #PART 1

  attr_reader :guess_word, :attempted_chars
  attr_accessor :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |el, i|
      indices << i if el == char
    end
    indices
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char }
  end

  #PART_2

  def try_guess(char)
    matches = self.get_matching_indices(char)

    if !matches.empty?
      self.fill_indices(char, matches)
    else
      @remaining_incorrect_guesses -= 1
    end

    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    response = gets.chomp
    self.try_guess(response)
  end

  def win?
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      false
    end
  end
end
