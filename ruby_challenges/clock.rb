# Problem:
#   create a clock object that contains an at class metnod that when
#   called and passed an integer number will return that number in a
#   military hour - 13 = 13:00 when to_s is chained after it

#   you should aslo be able to add and subtract minutes from your clock
#   object

# Example:
#  Test suite consists of 14 runs:
#  - calling the class method at, passing the integer 8 and then chaining
#    the class method to_s returns the string object "08:00"
#    *** class method vs. .at being a constructor method??????
#  - doing the same as above but passing two arguments to .at (both integers)
#    returns an hour and minutes ex: (11, 9) = '11:09'
#  - test_add_a_few_minutes chains a .+ method that takes an integer argument
#    to the .at method. when to_s is called on that object returns arg as min
#
# Data
#   +
#   input: integer
#   output: an object with a differect time that adds the integers to minutes
#
# Algorithm:
#   +
#   -determine total number of minutes, thaking the integer argument into
#    consideration.
#    * multiply 60 by @hour and add it to @min, then add integer. Assign this
#      value to a local variable called total_minutes
#   -find out how many minutes are left after accounting for full days
#    * full day equals 24 * 60, or 1440 min
#    * call modulo on total minutes and return value is minutes left over
#      after accounting for full days
#    * call divmod on the remining minutes and pass 60, assinging hours and
#      minutes, then pass to new
#   -
#   do same as above but subtract minutes
# algorithm:
#   to pass different objects to assert equal, create an custom equality
#   instance method that returns true if the to s called on both the calling
#   object and argument object both equal the same value


class Clock
  def self.at(hour, min=0)
    new(hour, min)
  end

  def +(num)
    self.new(hour, min + num)
  end

  def to_s
    "#{"%02d" % hour}:#{"%02d" % min}"
  end

  def +(minutes)
    hour, min = total_plus_minutes(minutes).divmod(60)
    Clock.new(hour, min)
  end

  def -(minutes)
    hour, min = total_minus_minutes(minutes).divmod(60)
    Clock.new(hour, min)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  private

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  attr_accessor :hour, :min

  def total_plus_minutes(minutes)
    ((hour * 60) + min + minutes) % 1440
  end

  def total_minus_minutes(minutes)
    ((hour * 60) + min - minutes) % 1440
  end
end
