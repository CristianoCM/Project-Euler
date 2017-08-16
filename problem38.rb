=begin
  Take the number 192 and multiply it by each of 1, 2, and 3:

  192 × 1 = 192
  192 × 2 = 384
  192 × 3 = 576

  By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

  The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

  What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
=end

class Problem38
  vet = [1]
  testeComXElementos = 2
  max9Pan = 123456789; theVect = []; theN = 0
  while testeComXElementos < 10
    for n in 1..9999

      txt = ""

      for v in 0..vet.size-1
        txt += (n * vet[v]).to_s
      end

      if txt.split("").sort == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        if max9Pan < txt.to_i
          theVect = vet
          theN = n
          max9Pan = txt.to_i
        end
      end

    end

    vet << vet.last + 1
    testeComXElementos += 1
  end

  p max9Pan, theVect, theN
end