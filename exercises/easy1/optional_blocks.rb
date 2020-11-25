#def compute
#  block_given? ? yield : 'Does not compute.'
#end
#
#p compute { 5 + 3 } == 8
#p compute { 'a' + 'b' } == 'ab'
#p compute == 'Does not compute.'
#
# FURTHER EXPLORATION

def compute(arg)
  block_given? ? yield(arg) : arg
end

p compute(3) { |x| x + 5 } == 8
p compute('str') { |s| s + 'ing' } == 'string'
p compute([]) { |a| a << 'array' } == ['array']
p compute('dinky') == 'dinky'
