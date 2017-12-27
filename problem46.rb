=begin
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
=end

require 'prime'

class Problem46
  odd = 9
  tries = false
  until odd > 6000
    if !Prime.prime?(odd)
      prime = (Math.sqrt(odd).floor...odd).select {|x| Prime.prime?(x) }
      for index in 0..prime.size-1
        for num in 1..Math.sqrt(odd)
          calc = prime[index] + 2 * num ** 2
          if calc == odd
            p odd.to_s + " = " + prime[index].to_s + " + 2 x " + num.to_s + "^2"
            tries = true
            break
          end
        end
        break if calc == odd
        tries = false
      end
      p "NOPS! " + odd.to_s if !tries
    end
    odd += 2
  end
end
