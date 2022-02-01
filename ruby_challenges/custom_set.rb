# Problem:
# create a class that is similar to the set class in ruby; a class
# that creates objects that can store data (numbers in this case)
# - instance methods may be called on the set object

# Example:
# CustomSet is a class
# CustomSet objects may be instantiated with or without an argument
# - a valid argument appears to be an array of numbers
# - the class contains the following instance methods:
#   - constructor method
#   - empty?
#   - contains?
#   - subset?
#   - disjoint?
#   - eql?
#   - add
#   - intersection
#   - difference
#   - union
# - there are no class methods

# ---------------- constructor method ----------------
# Problem:
#   create an initialize method that takes either an array or nothing
#   - if it takes an array, then assign that array to an instance variable
#     called data
#   - if it doesn't take an argument, perhaps the instance var data should
#     be assigned to the default value of an empty array (data may be added
#     later)
# Example:
#   from the test suite it appears that the instantiation of an object may
#   take an array of integers as an argument or nothing.
# Data:
#   input: optional arg that is an array of integer elements
#   output: an instance variable assigned to either an array of integers
#           or a blank array
# Algorith:
#   create a method that defaults to an empty array of assigns an array of
#   integers to an instance metnod
# Code:
# class CustomSet
#   def initialize(data=[])
#     @data = data
#   end
# end

# --------------------- Empty? ----------------------
# Problem:
#   determine if the CustomSet has any elements or data in it
# Example:
#   the method is called on two different CustomSet objects:
#   - the one with an array of integers returns true
#   - the one without an array of integers returns false
# Data:
#   input: none - method called on a CustomSet object
#   output: true of false
# Algorithm:
#   write an instance method that determines if the value assinged to the
#   data instance variable is empty or not
#   - call Array#empty? on the instance variable @data
# Code:
  # def empty?
  #   @data.empty?
  # end

# ------------------ Contains?(integer) ------------------
# Problem:
#   determine if
# Example:
#   - the test suite shows an empty CustomSet object that returns false
#     when contains is called and integer 1 is passed as value
#   - it also shows a custom object that contains an instance variable with
#     the value of an array with integers 1,2 and 3. it returns true when
#     contains? is called on it and the integer 1 is passed as an argument
#   - it shows a CustomSet object that contains an instance variable @data that
#     is assinged to an array object with the elements 1,2 and 3 in it.
#     contains? is then called on this object and the integer 4 is passed as an
#     argument. This returns false
# Data:
# - contains?
#   input: an integer
#   output: true or false
# Algorithm:
#   write an instance method that determines if the integer object passed as an
#   argument to the method contains? is included in value assinged to the
#   instance object @data
#   - call Array#include? on @data and pass in the parameter passed to contain?
# Code:
  # def contains?(number)
  #   @data.include?(number)
  # end

# ------------------------ Subset? ---------------------------
# Problem:
#  determine if an array of integers/integer/empty array is a subset of
#  another array - or if the instance variable @data has all the elements in it
#  that another object's instance variable @data
# Example:
#  empty is subset of non empty
#  - when the method is called on an object with empty @data and the argument
#    is an object that doens't have an empty @data instance variable, it is True
#    - an empty array is a subset of an nonempty array
#  empty is subset of empty
#  - when the method is called on an object with an empty @data, and the object
#    passed is an object with an empty @data, it returns True
#    - an empty array is a subset of an empty array
#  non_empty_not_subset_of_empty
#  - when method called on object with non empty @data and object with empty
#    @data is passed as argument, it return False
#  test_set_is_subset_of_same_set_of_elements
#  - when method called on object and argument passed is another object with
#    same @data, it returns True
#  test_set_is_subset_of_larger_set
#  - when method called on object with smaller @data that contains elements that
#    are all in the @data of the object passed, returns true
#  test_not_subset_when_different_elements
#  - when method called on object that has completely different elements in
#    @data than the @data in the object passed, it returns false
#  Data:
#    input: CustomSet object
#    output: true or false
#  Algorithm:
#    write an instance method that returns true if:
#    - the object that the method is being called on has an empty array as the
#      value for its instance method @data
#      - call Array#empty? on data
#        this will return true or false
#    - all of the elements in @data of the object the method is being called on
#      are in the @data of the object passed to the method
#      - call Array#all? on data and pass in block with conditional that returns
#        true when Array#include? is called on the argument's array, and each
#        element is passed
#    - return false if the object calling the method doesn't have an empty
#      @data and the @data of the object passed to the method has an empty @data
#      - if none of the two above conditions are met, then return false
#  Code:
  # def subset?(other_set)
  #   (data + other_set.data).uniq.size == other_set.data.size
  # end

# --------------- disjoint? -------------------
# input: CustomSet object
# output: true or false

# returns true if:
#  - calling object empty and argument is empty
#  - calling object empty and arument not empty
#  - calling object not empty and argument is empty
#  - neither calling object or arguent emtpy but they share no elements

#  returns false if:
#  - neither calling oject or argument empty but they share an element

# return true neither CustomSet object have the same elements within the array
# assinged to their respective @data instance variable

# if we add the arrays together and the size of the array has no duplicate
# elements in it, then it is TRUE

# Code:
 # def disjoint?(other_object)
 #   combined_array = data + other_object.data
 #   combined_array == combined_array.uniq
 # end

 # ---------------- eql? -----------------
# Problem:
#   determine if two objects have the same value assinged to thier
#   respective @data instance variables
# Example:
#   - two objects with empty @data returns true
#   - an empty and non empty object returns false
#   - non empty and an empty returns false
#   - same elements out of order returns true
#   - different elements within each returns false
#   - both have same elements but one has duplicates returns true
# Data:
#   Input: CustomSet objects
#   Output: true or false
# Algorithm:
#   - return true if:
#     - both objects have empty @data instance variables
#     - both objects have @data that contains same elements but one has
#       duplicates
#     - both objects have exact same num of same elements but different order
#  - otherwise return false
# Code:
# def eql?(other_set)
#   data.sort.uniq == other_set.data.sort.uniq
# end

# ------------------ add --------------------
# Problem:
#   create an instance method that allows the user to add an element to the
#   data instance variable of a CustomSet objet
# Example:
#   from test suite, should be able to:
#   - add an object that has elements in @data and one with empty @data
#   - should also be able to add duplicate but no duplicates appear in @data
# Data:
#   input: an integer
#   output: a new new CustomSet object that has that element in it's @data array
# Algorithm:
#   push the integer object into @data but don't return an object with dupes
#   in the @data instance variable
# Code:
# def add(integer)
#   new_data = (@data << integer).uniq
#   CustomSet.new(new_data)
# end

# ******** needed to establish a CustomSet#== so that assert_equal is aware of
#          how to compare equality between seperate custom objects; in this
#          the custom objects being CustomSets

# ----------------------- intersection -----------------
# Problem: create an instance method that, when called on a CustomSet object,
#          returns a new object that contains all shared elements from the
#          @data instance variables, in both the calling object and argument
#          object, in its @data instance variable array
# Example:
#   - When called on an obect containing an empty @data array, and object
#     passsed as an argument has elements within its @data array, it will
#     return a new object with an empty array assinged to @data
#   - called on a non empty with an empty passed will return an empty object
#   - when calling object and argument object share no elements within their
#     data instance variable - returns a new CustomSet object that is empty
#   - when both objects share elements, a new object will be returned that
#     contains those shared elements within the array assinged to is @data
#     instance variable
# Data:
#   - input: CustomSet object
#   - output: new CustomSet object that contains the same elements within its
#     instance variable @data
# Algorithm:
#   - determine what if any elements exist in @data arrays of both the calling
#     object and the argument object
#   - return a new CustomSet object that contains those shared elements in its
#     own @data array
# Code:
#   - call each with object on calling obect data and pass in an empty array,
#     then pass a block that evalutes to true if they are included in the
#     argument object's data array
#   - def intetsection(other_set)
#      -initialize local var call new data that is empty array
#      -iterate over calling object @data and if arg obj @data contains the
#       num then pass to new_data array
#      -return new obj with new_data passed as arg on instantiation
#     end

# ------------------------ CustomSet#difference ------------------------
# Probem:
#   write an instance method that removes any elements from @data array that
#   are in the argument object's @data array
# Example:
#   - both calling and argument objects have empty @data array returns new obj
#     with empty @data
#   - calling object is empty but argument object has elements in @data
#     returns new object that has an empty @data
#   - calling object not empty, but arg obj empty returns al new set that
#     has the same element as the calling objects
#   - calling set and arg set have some elements in their respective @data
#     that are the same retuns a new object with same @data as calling obj but
#     they are removed if in arg set's @data
#   Data:
#     input: CustomSet object
#     output: CustomSet object
#   Algorithm:
#     initialize a new local variable called new_data and assing it to the
#     return value of the calling object's @data array minus any elements that
#     are also present in the argument set's @data
#     instantiate a new CustomSet object with new_data as an argument
#   Code:
#     def difference(other_set)
#       data.select (|num| !other_set.data.include(num) )
#     end
# ---------------- union ----------------------
#   Problem:
#     create an instance method that returns a new object that has
#     all of the elements in it that are in both calling and argumnet object's
#     @data arrays without duplicates
#   Example:
#     all four tests in test suite show simply adding both object's @data arrays
#     together and then removing dupes
#     the above result is the argument for the instantiation of new set object
#   Algorithm:
#     initialize a local variable and assign it to the return value of
#     adding both arrays together and removing duplicates
#     this new variable should then be passed to a new object instantiation
#  Code:
#  def union(other_set)
#    new_data = (data + other_set.data).uniq
#    CustomSet.new(new_data)
#  end

class CustomSet
  def initialize(data=[])
    @data = data.uniq
  end

  def empty?
    @data.empty?
  end

  def contains?(number)
    @data.include?(number)
  end

  def disjoint?(other_set)
    combined_array = data + other_set.data
    combined_array == combined_array.uniq
  end

  def subset?(other_set)
    (data + other_set.data).uniq.size == other_set.data.size
  end

  def ==(other_set)
    data == other_set.data
  end

  def eql?(other_set)
    data.sort.uniq == other_set.data.sort.uniq
  end

  def add(integer)
    (data << integer).uniq!
    self
  end

  def intersection(other_set)
    new_data = []
    data.each { |num| new_data << num if other_set.data.include?(num) }
    CustomSet.new(new_data)
  end

  def difference(other_set)
    new_data = data.select { |num| !other_set.data.include?(num) }
    CustomSet.new(new_data)
  end

  def union(other_set)
    new_data = (data + other_set.data).uniq.sort
    CustomSet.new(new_data)
  end

  protected

  attr_accessor :data
end
