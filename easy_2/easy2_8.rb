# there are two values to consider:
# - the value of the array element
# - the value of the array element yielded to the  block

# iterate over the array and on iteration determine what element
# has the highest value when yielded to the block

#

def max_by(array)
  return nil if array.empty?

  max_element = array[0]
  max_yield = yield(max_element)

  array[1..-1].each do |element|
    if yield(element) > max_yield
      max_yield = yield(element)
      max_element = element
    end
  end
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
