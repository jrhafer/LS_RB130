# problem: given a decimal integer, return a string roman numeral

# Example: from the test suite it appears that RomanNumeral is a class
#          and we instantiate new objects from this class by passing a
#          decimal number

#          there appear to be two instance methods:
#          - a constructor method that assigns an integer argument to an
#            instance variable
#          - and a to_roman method that reutrns the roman numeral of the
#            instance variable

# Data: input for constructor is an integer
#       input for to_roman is an integer
#       output for to_roman is a string
#       key of roman numerals to numbers can be stored as a hash

# Algorithm: create a class called RomanNumeral with a constructor method that
#            takes an ingers and stores it as an instance variable called
#            @dec_num

#            to_roman instance method:
#            - initialize a string object called roman_num and assing it to ''
#            - iterate over the values of the RomanNumerals hash and
#            - call divmod on the @dec_num
#            - reassign the remainder as the value of @dec_num on each
#              iteration** instead of mutating instance var, assign local
#              variable to it within the method and mutat that
#            - if the quotient is equal to one, then add the key for that
#              value in the rom numerals has to the string rom_num
#            - if the quotient is greater than one then mult that key by the
#              quotient and add to rom_num string
#            - return rom_num

ROMAN_NUMERALS = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

class RomanNumeral
  def initialize(dec_num)
    @dec_num = dec_num
  end

  def to_roman
    rom_num = ''
    num = @dec_num
    ROMAN_NUMERALS.values.each do |value|
      number, remainder = num.divmod(value)
      rom_num << ROMAN_NUMERALS.key(value) * number if number > 0
      num = remainder
    end
    rom_num
  end
end
