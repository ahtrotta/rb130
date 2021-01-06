def each(array)
  index = 0

  loop do
    yield array[index]
    index += 1
    break array if index == array.size
  end
end

p each([1, 2, 3, 4]) { |n| p n }
