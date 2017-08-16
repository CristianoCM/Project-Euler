=begin
The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form 2^6972593−1; it contains exactly 2,098,960 digits.
Subsequently other Mersenne primes, of the form 2p−1, have been found which contain more digits.

However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433×2^7830457+1.

Find the last ten digits of this prime number.
=end

class Problem97
  # Minha solução
  p (28433*2**7830457 + 1).to_s.split("").last(10).join("").to_i

  # Mais rápida que vi
  p ((28433 * (2**7830457)) +1) % 10000000000
  # Outras
  p (28433*2**7830457+1).to_s[2_357_195..2_357_206]
  p (28433*2**7830457+1)%10**10
end