def reduce(arr)
  acc = arr.first
  counter = 1

  while counter < arr.size
    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
