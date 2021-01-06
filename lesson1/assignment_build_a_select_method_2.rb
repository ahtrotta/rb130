def select(array)
  index = 0
  end_index = array.size
  result = []

  loop do
    current_element = array[index]
    result << current_element if yield(current_element)
    index += 1
    break result if index == end_index
  end
end

p select([1, 2, 3, 4]) { |el| el.even? }
