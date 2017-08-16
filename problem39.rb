=begin
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
=end

class Problem39
  possib = []
  maxSizePossib = 0; theOne = 0
  for p in 1..1000
    for a in 1..p/2
      for b in 1..p/2
        c = Math.sqrt(a**2 + b**2)
        possib << [a,b,c] if a + b + c == p
      end
    end
    if possib.size > maxSizePossib
      theOne = p
      maxSizePossib = possib.size
    end

    possib = []
  end

  p theOne
end