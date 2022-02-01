# Problem: given a set of one or more numbers, find the sum of all the multiples
#          of either 3 or 5, unless a custom list of numbers other than 3 of 5 is
#          given. Then return the sum of all numbers up to, but not including,
#          that number that are multiples of that list of numbers given.

# Example: the test suite shows a class method 'to' that is passed an argument
#          that appears to be the n converted to a set of 1 to n-1, and 3 and
#          5 are the default multiples

#          there is also an instance method that is called on an instance of
#          SumOfMultiples

#          a SumOfMultiple object is instantiated with digits that are then
#          used as the multiples

# Data:    input for both class and instance methods 'to' => single integer
#          output for both methods => single integer
#          input for instance of SumOfMultiples => one or more integers

# Algorithm: Create a class for SumOfMultiples that has three methods:
#            - instance method 'to'
#            - class method 'to'
#            - constructor method that takes one or more integers (splat)
#              and stores them as values in an arry for an instance variable

#            instance method takes an integer and iterates over it's range,
#            excluding itself, and adds the number to a local that is assigned
#            to zero if it is a multiple of the instance variables in the array
#            instance variable
#            then return that local variable
#            - iterate over the range and then for each number iterate over the
#              array of divisors and if the number is divided evenly by the
#              divisor then add it to the local variable that sums the numbers
#            - return the local variable assinged to the integer sum of
#              multiples

#            *** IF A NUMBER IS DIVISIBLE BY BOTH OR ALL DIVISORS, THEN
#                NUMBER IS ADDED MORE THAN ONCE => solution is to add all the
#                numbers to an empty array and then sum the array at the end
#                after calling uniq on it, instead of the local variable

#            the class method should create an array of numbers from 1 to n-1
#            and then call select on the array with the conditional that
#            the element/number in the range can be evenly multiplied by 3 or
#            5, then call sum on that return value. 5

# Code:

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(num)
    (1...num).to_a.select { |num| num % 3 == 0 || num % 5 == 0 }.sum
  end

  def to(num)
    multiples = []
    (1...num).to_a.each do |number|
      @numbers.each do |divisor|
        multiples << number if number % divisor == 0
      end
    end
    multiples.uniq.sum
  end
end
