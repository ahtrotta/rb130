fact = Enumerator.new do |y|
  y << 0
  factorial = 1
  counter = 1

  loop do
    y << factorial
    counter += 1
    factorial *= counter
  end
end

p fact.take(10)
