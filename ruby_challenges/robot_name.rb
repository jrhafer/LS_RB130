#Problem:
#  create a random name generator that creates robot names that consist
#  of two letters and three numbers.
#  - names are created when robot is created and when they are factory
#    reset
#  - no two names may ever be used
#Example:
#  a random generated name is created for a robot object on instantiation
#  and when an already existing robot object is reset
#  - the generator creates a name with 2 cap letters followed by 3 numbers
#  - if this name has already been generated and assigned to a previous
#    robot object, then it must be reset and again until it is unique
#  from the test suite there are three instance methods
#  - a constructor method - assigns random name
#  - a name method - returns a string name when called on object
#  - reset method
#Data:
#  constructor
#    input: none
#    output: instance variable consisting uniq string name paramaters:
#      - 2 upcase letters and 3 numbers
#      - string name not associated with other robot object
#    name
#      input: none
#      output: returns value assinged to instance variable - string
#    reset
#      input: none
#      output: new instance variable
#Algorthm:
#  create a class called robot that takes no argument on instantiation but
#  contains a constuctor method that randomly assigns a name
#  - a class variable assinged to an array may be created
#  - when a name is generated it will pushed into the array after
#    confirming that it doesn't exist in the class variable array already
#  - call the instance varaibe @name and assign it to the output of a name
#    generator
#    - generator method will create a string object and assign it to a local
#      varaible
#    - it will then call random on a range of A to Z and assign it to the local
#      object twice. It will then call random on the range 1 to 9 three
#      times and assign it to the local string variable
#    - after the name is generated, it will then be added to the class variable
#      assigned to an array with elements that are previously generated string
#      names directly from within the constructor method
#    - to check if this random name was generated and assigned before, the above
#      method should be wrapped in a loop and the break condition
#      is that the local varaibe created is cross referenced with a list of
#      already generated names and doesn't exist in there; the class var

# create an attr_accessor for name - make it private

# create instance method called reset
#   - reset should simply reassign the value assinged to @name and possibly
#     remove it from the class variable array of existing names
#   - create a helper method that removes the value of the existing @name
#     from the existing names array
#   - then call our name generator method and reassign the value to the
#     instance variable name for the calling object



class Robot
  attr_accessor :name

  @@existing_names = []

  def initialize
    @name = name_generator
    @@existing_names << @name
  end

  def reset
    remove_from_existing
    @name = name_generator
  end

  private

  def name_generator
    temp_name = ''
    loop do
      2.times { temp_name << ('A'..'Z').to_a.sample }
      3.times { temp_name << rand(0..9).to_s }
      break unless already_in_use(temp_name)
    end
    temp_name
  end

  def remove_from_existing
    @@existing_names.delete(name)
  end

  def already_in_use(temp_name)
    @@existing_names.include?(temp_name)
  end
end
