=begin
Let pn be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the remainder when (pn−1)^n + (pn+1)^n is divided by pn^2.

For example, when n = 3, p3 = 5, and 4³ + 6³ = 280 ≡ 5 mod 25.

The least value of n for which the remainder first exceeds 10^9 is 7037.

Find the least value of n for which the remainder first exceeds 10^10.
=end

require 'prime'

limit = 25_000
primes = Prime.first limit

for n in 7_037..limit
  pn = primes[n - 1]
  r = ((pn - 1)**n + (pn + 1)**n).remainder(pn**2)
  if r > 10_000_000_000
    p "N: " + n.to_s + " | Primo: " + pn.to_s + " | Remainder: " + r.to_s
    break
  end
end


# Outros que eu vi nos comentários
require 'prime'

limit = 25_000
primes = Prime.first limit

n = 0
primes.each {|pr|
        n += 1
        next if (n & 1) == 0
        x = 2 * n * pr
        break if x > 10_000_000_000
}
puts n