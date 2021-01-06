def reduce(array, default = 0)
  index = 0
  end_index = array.size
  result = default

  loop do
    current_element = array[index]
    result = yield(result, current_element)
    index += 1
    break result if index == end_index
  end
end

p reduce([1, 2, 3, 4, 5]) { |acc, num| acc + num }
p reduce([1, 2, 3, 4, 5], 10) { |acc, num| acc + num }
p reduce([1, 2, 3, 4, 5]) { |acc, num| acc + num if num.odd? }
