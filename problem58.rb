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
  
  #----------------------------------------------------------------------------------------
  # Diagonais
  #----------------------------------------------------------------------------------------
  # Inferior Direita:  1 9 25 49 -> √1 = 1, √9 = 3, √25 = 5, √49 = 7 | 0 +8 +16 +24 (+8)
  # Inferior Esquerda: 1 7 21 43 -> 0 +6 +14 +22 (+8)
  # Superior Direita:  1 3 13 31 57 91 -> 0 +2 +10 +18 +26 +34 (+8)
  # Superior Esquerda: 1 5 17 37 65 101 -> 0 +4 +12 +20 +28 +36 (+8)
  #----------------------------------------------------------------------------------------
  
  diag_2 = 3; plus_2 = 2
  diag_4 = 5; plus_4 = 4
  diag_6 = 7; plus_6 = 6
  diag_8 = 9; plus_8 = 8
  side_length = 1
  diagonals = [1]
  primes_diagonals = []
  prime_ratio = 100
  
  until prime_ratio < 10

    diagonals << diag_2
    diagonals << diag_4
    diagonals << diag_6
    diagonals << diag_8
    
    primes_diagonals << diag_2 if Prime.prime?(diag_2)
    primes_diagonals << diag_4 if Prime.prime?(diag_4)
    primes_diagonals << diag_6 if Prime.prime?(diag_6)
    #primes_diagonals << diag_8 if Prime.prime?(diag_8)  -> Vai ter sempre raíz, ou seja, não é primo
    
    plus_2 += 8; diag_2 += plus_2
    plus_4 += 8; diag_4 += plus_4
    plus_6 += 8; diag_6 += plus_6
    plus_8 += 8; diag_8 += plus_8

    side_length += 2
    
    prime_ratio = (primes_diagonals.size / diagonals.size.to_f) * 100
    
  end
  
  p "Diagonal size: " + side_length.to_s, "Prime diagonal ratio: " + primes_diagonals.size.to_s + "/" + diagonals.size.to_s + " = " + prime_ratio.to_s + "%"
  
end