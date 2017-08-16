=begin
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
=end

require 'prime'

class Problem41
  n = 1234567
  permu = n.to_s.split("").permutation.to_a
  for i in 0..(permu.size-1)
    theOne = permu[i].join("").to_i
    p theOne if Prime.prime?(theOne)
  end
end