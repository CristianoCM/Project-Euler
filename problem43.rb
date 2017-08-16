=begin
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
=end

class Problem43
  n = 1234567890
  permu = n.to_s.split("").permutation.to_a
  sum = 0
  for i in 0..(permu.size-1)
    next if permu[i].first == "0"
    by2 = permu[i][1..3].join("").to_i % 2
    by3 = permu[i][2..4].join("").to_i % 3
    by5 = permu[i][3..5].join("").to_i % 5
    by7 = permu[i][4..6].join("").to_i % 7
    by11 = permu[i][5..7].join("").to_i % 11
    by13 = permu[i][6..8].join("").to_i % 13
    by17 = permu[i][7..9].join("").to_i % 17
    sum += permu[i].join("").to_i if by2 + by3 + by5 + by7 + by11 + by13 + by17 == 0
  end
  p sum
end