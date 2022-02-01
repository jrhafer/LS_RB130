#Problem: given a string word and a list of other words - return all other
#         words that contain the same exact letters as the string word

#Example: from the test suite it appears there is a class method called
#         Anagram
#         * two instance methods:
#           - constructor method that takes a sting object as an argument and
#             assigns it to an instance variable
#           - instance method called match that takes an array object, with
#             string objects as elements, as an
#             argument and returns an array of strings that have the same exact
#             letters as the instance variable of the object it is called on
#             - if there are no elements in the array that match the instance
#               variable, then the match method returns an empty array

#Data: input into constructor method is a string
#      input to match is an array
#      output from match is an array

#Algorithm: create a class called Anagram and create a constructor method
#           within it that assings the input string to an instance variable
#           called word

#           create instance method called match that takes an array of strings
#           as an argument
#           compare all the letters to the @word and if they are the exact same
#           then return them in an array
#            - no words should return if the same as @ word
#            - call select on the argument passed to the match method and pass
#              a block with the condition that the words split into an array
#              and sorted equal @word split into an array and sorted
#              - initialize a variable called initial_word and assign it to the
#                value of @word split and sorted - this will be used to compare
#                each string element of the argument array or word_list arg
#                ****should not be case sensitive*****
#                    - call downcase on every element of split array
#code:

class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_list)
    comparison_word = @word.split('').map(&:downcase).sort
    word_list.select do |list_word|
      same_letters?(list_word, comparison_word) && \
      not_same_word?(list_word, comparison_word)
    end
  end

  private

  def same_letters?(list_word, comparison_word)
    list_word.split('').map(&:downcase).sort == comparison_word
  end

  def not_same_word?(list_word, comparison_word)
    list_word.downcase != @word.downcase
  end
end
