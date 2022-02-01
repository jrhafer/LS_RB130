def step(start, stop, increment)
  total = start
  while total <= stop
    yield(total)
    total += increment
  end
end


step(1, 10, 3) { |value| puts "value = #{value}" }
