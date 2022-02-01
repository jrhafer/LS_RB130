def all?(array)
  array.each { |num| return false if !yield(num) }
  true
end

all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true
