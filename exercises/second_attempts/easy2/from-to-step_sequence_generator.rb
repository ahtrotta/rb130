def step(first, last, step)
  value = first

  loop do
    yield(value)
    value += step
    break if value > last
  end

  (first..last)
end

step(1, 10, 3) { |value| puts "value = #{value}" }
