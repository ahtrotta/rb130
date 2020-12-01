fact = Enumerator.new do |y|
  n = 1
  i = 0

  loop do
    y.yield(n)
    n = n * (i + 1)
    i += 1
  end
end

6.times { p fact.next }

fact.each_with_index do |num, idx|
  puts "#{idx}! == #{num}"
  break if idx >= 8
end

6.times { p fact.next }

fact.each_with_index do |num, idx|
  puts "#{idx}! == #{num}"
  break if idx >= 8
end
