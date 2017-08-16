=begin
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7.
Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
=end

require 'prime'

class Problem37

  max = 0; num = 21; soma = 0

  while max < 11
    if Prime.prime?(num) && !num.to_s.split("").any?{|x| ["0", "4", "6", "8"].include?(x)}

      # Left to Right
      lr = false
      vet = num.to_s.split("")
      while vet.size > 1
        vet.shift
        if !Prime.prime?(vet.join.to_i)
          lr = false
          break
        else
          lr = true
        end
      end

      # Right to Left
      rl = false
      if lr
        vet = num.to_s.split("")
        while vet.size > 1
          vet.pop
          if !Prime.prime?(vet.join.to_i)
            rl = false
            break
          else
            rl = true
          end
        end
      end

      if rl
        soma += num
        max += 1
        p max.to_s + " - Numero: " + num.to_s
      end
    end

    num += 2
  end

  p "Soma: " + soma.to_s

end