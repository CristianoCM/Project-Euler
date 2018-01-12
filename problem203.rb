=begin
The binomial coefficients nCk can be arranged in triangular form, Pascal's triangle, like this:

1	
1		1	
1		2		1	
1		3		3		1	
1		4		6		4		1	
1		5		10		10		5		1	
1		6		15		20		15		6		1	
1		7		21		35		35		21		7		1
.........
It can be seen that the first eight rows of Pascal's triangle contain twelve distinct numbers: 1, 2, 3, 4, 5, 6, 7, 10, 15, 20, 21 and 35.

A positive integer n is called squarefree if no square of a prime divides n. Of the twelve distinct numbers in the first eight rows of Pascal's triangle, all except 4 and 20 are squarefree. The sum of the distinct squarefree numbers in the first eight rows is 105.

Find the sum of the distinct squarefree numbers in the first 51 rows of Pascal's triangle.
=end

require 'prime'

lines_wanted = 51
pascal_triangle = [[1], [1, 1]]
for i in 1..lines_wanted-pascal_triangle.size
  now = pascal_triangle[i]
  pascal_triangle << []
  for j in 0..now.size
    if j == 0
      pascal_triangle[i + 1] << now[j]
    elsif j == now.size
      pascal_triangle[i + 1] << now[0]
    else
      pascal_triangle[i + 1] << now[j] + now[j - 1]
    end
  end
end

pascal_units = pascal_triangle.flatten.uniq
primes_square = []
Prime.each(Math.sqrt(pascal_units.max)) do |prime|
  primes_square << prime**2
end

result = []
pascal_units.each do |a|
  squarefree = true
  primes_square.select{|z| z <= a}.each do |b|
    squarefree = false if a % b == 0
  end
  result << a if squarefree
end

p "Sum: " + result.reduce(:+).to_s


# Códigos BEM melhores de Japas que estavam no fórum:
# Nº 1
N = 51
SQ_primes = [4,9,25,49] # < 51

def get_next(tri)
  [1,
   (1...(tri.size)).map{|i| tri[i-1] + tri[i]},
   1].flatten
end

tri = [[1],[1, 1]]
(3..N).each{|g| tri << get_next(tri[-1])}

p tri.flatten.uniq.select{|f| SQ_primes.select{|sq| f % sq == 0}.empty?}.inject(:+)

# Nº 2
require 'prime'
require 'set'

def pascal a
  return [1] if a == []
  return [1, 1] if a == [1]
  [1, a.each_cons(2).map{|e| e.inject(:+)}, 1].flatten
end

primes = Prime.first(15)
set = Set.new
a = []
for i in 1..51
  a = pascal(a)
  set += a.select{|n| not primes.select{|q| q <= i}.any?{|q| n % q ** 2 == 0}}
end

puts set.inject(:+)