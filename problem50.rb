=begin
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
=end

require 'prime'

pri = []
Prime.each(5_000) do |prime|
  pri << prime
end

results = []
for a in 0..pri.size-1
  for b in a+1..pri.size-1
    now = pri[a..b]
    sum = now.reduce(:+)
    break if sum > 999_999
    results << [now.size, sum] if Prime.prime?(sum)
  end
end

p results.sort.last