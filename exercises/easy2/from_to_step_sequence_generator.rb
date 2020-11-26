def step(n1, n2, step)
  current = n1

  loop do
    break if current > n2
    yield(current)
    current += step
  end

  current - step
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
