=begin
It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two positive integers?
=end

num = 200
poss = 0
poss_vet = [1,2,3,4]
result = [[[]]]
num.times{result[0][0] << 1}

for index in 1..num-1
  poss_permu = poss_vet.repeated_combination(index).to_a
  ok = poss_permu.select{|z| z.inject(0){|sum,x| sum + x } == num }
  result << ok if ok.size != 0
end

result = result.flatten(1)
p "Possibilities: " + result.size.to_s