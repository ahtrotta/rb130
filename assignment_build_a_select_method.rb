def select(array)
  counter = 0
  result = []

  while counter < array.size
    result << array[counter] if yield(array[counter])
    counter += 1
  end

  result
end

p (select([1, 2, 3, 4, 5]) { |num| num.odd? })
p (select([1, 2, 3, 4, 5]) { |num| puts num })
p (select([1, 2, 3, 4, 5]) { |num| num + 1 })
