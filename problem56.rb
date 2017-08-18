=begin
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size,
the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
=end

class Problem56
  digitSum = 0
  for a in 20..99
    for b in 20..99
      ss = (a**b).to_s.split("").map(&:to_i).sum
      if ss > digitSum
        digitSum = ss
        p a.to_s + "^" + b.to_s + " = " + (a**b).to_s + " = " + ss.to_s + " digits sum"
      end
    end
  end

  p digitSum
end