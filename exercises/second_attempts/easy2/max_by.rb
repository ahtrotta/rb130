def max_by(array)
  return nil if array.empty?
  return array.first if array.size == 1

  index = 1
  max_element, max_value = array.first, yield(array.first)

  loop do
    current_element = array[index]
    current_value = yield(current_element)

    if current_value > max_value
      max_element = current_element
      max_value = current_value
    end

    index += 1
    break if index >= array.size
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
