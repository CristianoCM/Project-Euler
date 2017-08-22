=begin
There are exactly ten ways of selecting three from five, 12345:

123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

In combinatorics, we use the notation, 5C3 = 10.

In general,

nCr =	n! / r!(n−r)!
,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?
=end

class Problem53
  oneMore = 0
  for n in 23..100
    for r in 1..n
      c = (1..n).inject(1, :*) / ((1..r).inject(1, :*) * (1..(n - r)).inject(1, :*))
      oneMore += 1 if c > 1_000_000
    end
  end
  p oneMore
end