#def divisors(num)
#  result = [1, num].uniq
#
#  (2..Math.sqrt(num)).each do |divisor1|
#    divisor2 = num / divisor1
#    result.concat([divisor1, divisor2]) if num % divisor1 == 0
#  end
#
#  result.sort
#end

def divisors(num)
  result = []
  primary_divisor = 1
  last_divisor = Math.sqrt(num).floor

  loop do
    if num % primary_divisor == 0
      secondary_divisor = num / primary_divisor
      result.concat([primary_divisor, secondary_divisor])
    end

    primary_divisor += 1
    break if primary_divisor > last_divisor
  end

  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
