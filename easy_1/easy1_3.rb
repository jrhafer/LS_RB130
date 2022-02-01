def missing(array)
  range = (array[0]..array[-1]).to_a
  range.select { |number| !array.include?(number) }
end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
