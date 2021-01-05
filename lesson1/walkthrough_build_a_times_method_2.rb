def times(number)
  (0...number).each { |num| yield(num) }
  number
end

p times(5) { |n| puts n }
