=begin
Comparing two numbers written in index form like 211 and 37 is not difficult, as any calculator would confirm that 211 = 2048 < 37 = 2187.

However, confirming that 632382518061 > 519432525806 would be much more difficult, as both numbers contain over three million digits.

Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

NOTE: The first two lines in the file represent the numbers in the example given above.
=end

class Problem99
  vet = []
  File.open("myPath\\problem99_base_exp.txt", "r") do |f|
    f.each_line do |line|
      vet << line.delete("\n").split(",").map(&:to_i)
    end
  end
  p vet
  maxResult = 0; theI = 0
  for i in 0..vet.size-1
    pow = vet[i][0]**vet[i][1]
    if maxResult < pow
      maxResult = pow
      theI = i
    end
  end
  p "Position: " + (theI + 1).to_s
end
