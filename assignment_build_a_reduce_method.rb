array = [1, 2, 3, 4, 5]

def reduce(arr, def_val=0)
  acc = def_val
  counter = 0

  while counter < arr.size
    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc + num if num.odd? }
