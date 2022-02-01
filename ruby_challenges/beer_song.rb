# problem: create a program that can return the '99 Bottles of Beer on the Wall'
#          song

# example: The test suite show that there is a class called BeerSongTest that
#          contains three class methods:
#          - verse => takes a single integer argument and returns a string
#                     with the value of a verse from the song that starts with
#                     the argument as the num of bottles of beer on the wall in
#                     the first line of the verse, and the arg minus one as the
#                     value in the next line of the verse.
#                     - the returned string has a new line character after the
#                       first line and a new line character after the last line

#         *if the number is one, then the following word bottle must be singular
#         *if the number is zero it must read out 'no more bottles of beer'


# Data: the verse class method takes a single integer argument and returns a
#       string object with two sentences that both end in \n
#       - the first line of the string contains an interpolated argument
#       - the second line of the string contains an interpolated argument - 1

# Algorithm: create a class method that takes one argument and then returns
#            a string that inerpolates that arument into the first line and
#            the value of the argument - 1 in the next line

class BeerSong
  def self.verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end
end
# ***** revise so that common method are written for each line - each line may
#  - maybe iterate over the number if above zero and the next num
