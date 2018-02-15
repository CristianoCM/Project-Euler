=begin
The cube, 41063625 (345³), can be permuted to produce two other cubes: 56623104 (384³) and 66430125 (405³). In fact, 
41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are cube.
=end

cubes = (100..6_000).map{|n| n**3 }

r = []
for a in 0..cubes.size-1
  r.clear
  r << cubes[a]
  for b in a+1..cubes.size-1
    ta = cubes[a].to_s
    tb = cubes[b].to_s
    break if tb.length > ta.length
    r << cubes[b] if ta.split("").sort == tb.split("").sort
  end
  p r if r.size >= 5
end

# Outro melhor usando Hash que vi nos comentários

k = {}  
n = 999

loop do
n += 1
m = n ** 3

key = m.to_s.split("").sort.join

if k.has_key?(key)
  k[key][0] += 1
  k[key] << m
  if k[key][0] == 5
    p k[key]
    break
  end
else
  k[key] = [1, m]
end

end