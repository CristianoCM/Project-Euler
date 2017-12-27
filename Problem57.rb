=begin
It is possible to show that the square root of two can be expressed as an infinite continued fraction.

√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

By expanding this for the first four iterations, we get:

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?
=end

class Problem57
  
  numer = 0
  
  for i in 1..1000
    if i == 1
      p i.to_s + " iterations: " + (1 + Rational(1, 2)).to_s
    else
      frac = 2 + Rational(1, 2)
      (i-2).times{frac = 2 + Rational(1, frac)}
      frac = 1 + Rational(1, frac)
      p i.to_s + " iterations: " + frac.to_s
      numer += 1 if frac.numerator.to_s.size > frac.denominator.to_s.size
    end
  end

  p "Numerators with more digits than denominator: " + numer.to_s
  
end