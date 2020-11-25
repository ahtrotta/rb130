def divisors(n)
  divs = (1..Math.sqrt(n)).each_with_object([]) do |div, arr|
    arr << div << (n / div) if n % div == 0
  end

  divs.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(49)
