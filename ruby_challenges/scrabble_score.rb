
# problem: return a scrabble score for a word passed

# example: from the test suite it appears that there is an instance
#          class called Scrabble and when we instantiate an object from
#          this class, we pass a string argument - our argument may not be
#          a string - it will then score a 0

#          there are two instance methods:
#          - constructro method that stores our word in an instance var
#          - a score method that returns an integer as the score based
#            on the list of letters and their corresponding scores.

#          one class method:
#          - does the same as score instance method

# Data: input for constructor is a string.
#       output for the score instance method is an integer
#       store letters and their scores with hash

# algorithm: create class called Scrabble and write a constructor method
#            for it that assigns string argument to an instance variable

#            create a hash for the scores and letters to be stored in

#            create a score instance method that iterates over the split
#            instance variable and adds the correct score for each letter
#            ***uppercase all letters form input to match hash***
#            - initialize a local variable called score and assign int 0
#            - assign working_word to split word and uppercase
#            - iterate over working_word, calling each individual letter
#              - then sub iterating over the keys in our hash for scores
#                if the key includes the letter we are iterating over from
#                our word, then add the key's value to our score variable
#            - return score

#            - for the class method, just create an instance of Scrabble
#              and call the above instance method on it.

# code:

SCRABBLE_SCORE = {
  ['A', 'E', 'I','O', 'U', 'L', 'N', 'R', 'S', 'T']=>	1,
  ['D', 'G']=>	2,
  ['B', 'C', 'M', 'P']=>	3,
  ['F', 'H', 'V', 'W', 'Y']=> 4,
  ['K']=> 5,
  ['J', 'X']=>	8,
  ['Q', 'Z']=>	10
}

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    word_score = 0
    return word_score unless @word
    @word.split('').map(&:upcase).each do |letter|
      SCRABBLE_SCORE.keys.each do |letters|
        if letters.include?(letter)
          word_score += SCRABBLE_SCORE[letters]
        end
      end
    end
    word_score
  end

  def self.score(word)
    self.new(word).score
  end
end
