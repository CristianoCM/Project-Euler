=begin
Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).

There are 120 reversible numbers below one-thousand.

How many reversible numbers are there below one-billion (10^9)?
=end

max = 100_000_000
reversible_numbers = 0
for a in 10...max
  b = a.to_s.reverse.to_i
  next if a.to_s.length != b.to_s.length
  resp = a + b
  next if resp.even?
  next if resp.to_s.index(/[24680]/)
  reversible_numbers += 1
end

p reversible_numbers

# 120 -> 1 mil
# 720 -> 10 mil
# 720 -> 100 mil
# 18720 -> 1 milhão
# 68720 -> 10 milhões
# 608720 -> 100 milhões