=begin
Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

37 36 35 34 33 32 31
38 17 16 15 14 13 30
39 18  5  4  3 12 29
40 19  6  1  2 11 28
41 20  7  8  9 10 27
42 21 22 23 24 25 26
43 44 45 46 47 48 49

It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ˜ 62%.

If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?
=end

require 'prime'

class Problem58
  
  # Proporção de crescimento: 1 8 16 24 36 ...
  # Proporção de números pulados para chegar na diagonal: 0 1 3 5 7 ...
  mul = 1
  nums = [1]
  num_now = 1
  side_length = 1
  diag = 8
  diagonals = [1]
  primes_diagonals = []
  prime_ratio = 100
  
  until prime_ratio < 30
  
    diag_prop = side_length
    diag.times{
      num_now += 1
      nums << num_now
      if diag_prop == 0
        diagonals << num_now
        primes_diagonals << num_now if Prime.prime?(num_now)
        diag_prop = side_length
      else
        diag_prop -= 1
      end
    }
    mul += 1
    side_length += 2
    diag = 8 * mul
    
    prime_ratio = ((primes_diagonals.size / diagonals.size.to_f) * 100).round
    
  end
  
  p "Diagonal size: " + side_length.to_s, "Prime diagonal ratio: " + primes_diagonals.size.to_s + "/" + diagonals.size.to_s + " = " + prime_ratio.to_s + "%"
  
  #p "All sequence: " + nums.to_s, "Diagonal size: " + side_length.to_s, "Diagonals: " + diagonals.to_s, "Primes diagonals: " + primes_diagonals.to_s, "Prime diagonal ratio: " + primes_diagonals.size.to_s + "/" + diagonals.size.to_s + " = " + prime_ratio.to_s + "%"
  
end
