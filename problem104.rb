=begin
The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
It turns out that F541, which contains 113 digits, is the first Fibonacci number for which the last nine digits are 1-9 pandigital (contain all the digits 1 to 9, but not necessarily in order). And F2749, which contains 575 digits, is the first Fibonacci number for which the first nine digits are 1-9 pandigital.

Given that Fk is the first Fibonacci number for which the first nine digits AND the last nine digits are 1-9 pandigital, find k.
=end

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584
def fibonacci(n)
  return [] if n < 1
  return [1] if n == 1
  vet = [0, 1]
  (n - 2).times{vet << vet[vet.size-1] + vet[vet.size-2]}
  return vet
end

result = fibonacci(50_000)

for i in 0..result.size-1
  ver_final = result[i].to_s[0..8].split("").sort
  ver_inicio = result[i].to_s.reverse[0..8].split("").sort
  p "FINAL: " + i.to_s if ver_final == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  p "INICIO: " + i.to_s if ver_inicio == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
end