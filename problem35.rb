# Project Euler - Problem 35
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?

require 'prime'

class Problem35

  circularPrimes = []

  Prime.each(1_000_000) do |n|
    next if n == 1 || n.to_s.split("").include?('0')

    eCircular = true
    tamanho = n.to_s.size
    novoNum = 0

    while tamanho > 1
      if tamanho == n.to_s.size
        vet = n.to_s.split("")
      else
        vet = novoNum.to_s.split("")
      end
      vet << vet[0]
      vet.shift
      novoNum = vet.join.to_i
      if !Prime.prime?(novoNum)
        eCircular = false
        break
      end
      tamanho -= 1
    end

    circularPrimes << n if eCircular
  end

  p circularPrimes, circularPrimes.size

end