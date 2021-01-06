def count(*args)
  return 0 if args.empty?
  index = 0
  count = 0

  until index == args.size
    count += 1 if yield(args[index])
    index += 1
  end

  count
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
