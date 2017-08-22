=begin
The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
=end

class Problem63
  qtd = 0
  for num in 1..1000
    for exp in 1..1000
      qtd += 1 if (num**exp).to_s.size == exp
    end
  end
  p qtd
end