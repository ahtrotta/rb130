def times(number)
  counter = 0

  loop do
    yield counter
    counter += 1
    break counter if counter == number
  end
end

times(5) { |n| puts n }
