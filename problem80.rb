=begin
It is well known that if the square root of a natural number is not an integer, then it is irrational. The decimal expansion of such square roots is infinite without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of the first one hundred decimal digits is 475.

For the first one hundred natural numbers, find the total of the digital sums of the first one hundred decimal digits for all the irrational square roots.
=end

require 'bigdecimal'

sum = 0
for n in 1..100
  calc = BigDecimal(n).power(0.5, 102)
  calcs = calc.to_s
  if calcs.length > 5
    calcp = calcs[2..101]
    sum += calcp.split("").map(&:to_i).reduce(:+)
  end
end

p sum

# Outra solução que encontrei no fórum
require "bigdecimal"

puts (1..100).select { |i| Integer.sqrt(i) != Math.sqrt(i) }.collect { |i|
  BigDecimal(i).sqrt(100).to_s[2..101].chars.collect {|c| c.to_i}.sum
}.sum