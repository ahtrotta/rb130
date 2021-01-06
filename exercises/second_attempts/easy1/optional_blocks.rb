#def compute
#  block_given? ? yield : 'Does not compute'
#end
#
#p compute { 5 + 3 } == 8
#p compute { 'a' + 'b' } == 'ab'
#p compute == 'Does not compute'

# Further Exploration

def compute(input)
  block_given? ? yield(input) : 'Does not compute'
end

p compute(10) { |num| num + 7 } == 17
p compute('string') { |str| 'this is a ' + str } == 'this is a string'
p compute(:symbol) == 'Does not compute'
