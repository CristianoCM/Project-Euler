=begin
The palindromic number 595 is interesting because it can be written as the sum of consecutive squares: 6² + 7² + 8² + 9² + 10² + 11² + 12².

There are exactly eleven palindromes below one-thousand that can be written as consecutive square sums, and the sum of these palindromes is 4164. Note that 1 = 0² + 1² has not been included as this problem is concerned with the squares of positive integers.

Find the sum of all the numbers less than 10^8 that are both palindromic and can be written as the sum of consecutive squares.
=end

limit = 100_000_000

pot = []
max_pot = Math.sqrt(limit / 2).floor
(1..max_pot).each{|n| pot << n**2 }

palin = []
for start in 0..pot.size-2
  for tend in start+1..pot.size-1
    calc = pot[start..tend].reduce(:+)
    break if calc >= limit
    palin << calc if calc.to_s == calc.to_s.reverse
  end
end

resp = palin.uniq.sort
p resp, "QTD: " + resp.size.to_s, "SUM: " + resp.reduce(:+).to_s