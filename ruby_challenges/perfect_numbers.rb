#problem: given a number, return one of three classifications of that
#         number regarding all of the number's divisors excluding itself:
#         - find the aliquot sum: all positive divisors summed
#         - 3 categories:
#           1)perfect number => aliquot sum equals original number
#           2)abundant number => aliquot sum > original number
#           3)deficient number => aliquot sum < original number

#Example: The test suite requires a class method called classify
#         that returns one of the
#         above classifications and returns an argument for any number Less
#         less than zero -or equal to zero?

#Data: input: positive integer
#      output: string or StandardError if <=0

#Algorithm: find aliquot number
#           - call a range excluding number to an array and select
#             all elements of array that divide equally into number, then
#             call sum on array - private helper method
#           pass aliquot number to case statment that returns one of the
#           three classifications

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    case aliquot(number)
    when number then 'perfect'
    when (1..number - 1) then 'deficient'
    else 'abundant'
    end
  end

  private

  def self.aliquot(number)
    (1...number).to_a.select { |num| number % num == 0 }.sum
  end
end
