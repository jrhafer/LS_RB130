# Problem:
#
# - Given a year, month and one of the following(not case sens):
#   -'first'
#   -'second'
#   -'third'
#   -'fourth'
#   -'fifth'
#   -'last'
#   -'teenth' a day of the month between 13 to 19
#     - there are exactly 7 days that are teenths
#     - every day of the week has a teenth in a month
#   - and a day of the week (sun. to sat.)
# write an instance method called dayfor the class Meetup that takes two
# argument, first last, and day of the week, and returns the exact date

# Example:
#  The first Monday of January 2021
#  The third Tuesday of December 2020
#  The teenth wednesday of December 2020
#  The last Thursday of January 2021
#
# from the test suite it appears that the Meetup class assigns both a
# month and year to an instance on instantiation
# - Meetup#day returns the date of the month of an instance of that month,
#   taking into consideration both the month and year that are instance
#   variables belonging to the instance of the object
# - if the fifth week is called on a month and year that doesn't have a
#   fifth week, then return nil

# there are two methods:
#  - constructor method that takes two arguments, month and year, and
#    assigns them to instance variables
#  - there is an instance method called day that takes two arguments, day
#    of the week, and order in month of teenth, and returns a full date
#    including day month and year

# requires date class

# Data:
#   input: two string objects
#   output: a date object with the correct date

# Algorithm:
#   create a class called Meetup and create an initialize method that takes
#   two arguments and assigns them to instance variables
#
#   -initialize a local varaible assigned to an empty array called days
#   -iterate over the month by using the Date#next_day method
#     -initialize a local variabe called date and assingn it to the value
#      of a Date object with the same month and year of the object, but make
#      date 1 and then call the method monday? to sunday? on it, depending on
#      the day of the week passed to the day method
#      - add date object to days array if true, otherwise:
#       - reassign the local variable date to itself with next_day called
#         unless the month changes
#       - the break condition to end the loop is if the month in date doesn't
#         equal the month of the @month instance variable
#         *** break if date.month != @month
#   - after all days are added to the days array:
#     - call





require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, ordinal)
    days = []
    date = Date.new(@year, @month, 1)
    until date.month != @month
      days << date if date.cwday == numerical(day_of_week)
      date = date.next_day
    end
    find_date(days, ordinal)
  end

  private

  def numerical(day_of_week)
    case day_of_week.downcase
    when 'monday' then 1
    when 'tuesday' then 2
    when 'wednesday' then 3
    when 'thursday' then 4
    when 'friday' then 5
    when 'saturday' then 6
    when 'sunday' then 7
    end
  end

  def find_date(days, ordinal)
    case ordinal.downcase
    when 'first' then days.first
    when 'second' then days[1]
    when 'third' then days[2]
    when 'fourth' then days[3]
    when 'fifth' then days[4]
    when 'last' then days.last
    else find_teenth(days)
    end
  end

  def find_teenth(days)
    days.each do |date|
      return date if (13..19).to_a.include?(date.day)
    end
  end
end
