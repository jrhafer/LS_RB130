items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *first_items, fourth |
  puts "#{first_items.join(', ')}"
  puts "#{fourth}"
end

puts " "

gather(items) do |first, *middles, last|
  puts first
  puts "#{middles.join(', ')}"
  puts "#{last}"
end

puts " "

gather(items) do |first, *last_items|
  puts "#{first}"
  puts "#{last_items.join(', ')}"
end

puts " "

 
