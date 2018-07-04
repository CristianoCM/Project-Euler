cube = (0..9).to_a.combination(6).to_a
ss = cube.size - 1
result = 0

for x in 0..ss
  for y in x+1..ss

    c1 = cube[x]
    c2 = cube[y]

    if c1.include?(6) and !c1.include?(9)
      c1 << 9
    elsif c1.include?(9) and !c1.include?(6)
      c1 << 6
    end

    if c2.include?(6) and !c2.include?(9)
      c2 << 9
    elsif c2.include?(9) and !c2.include?(6)
      c2 << 6
    end

    # 01, 04, 09, 16, 25, 36, 49, 64, and 81
    if (c1.include?(0) and c2.include?(1)) or (c2.include?(0) and c1.include?(1))
      if (c1.include?(0) and c2.include?(4)) or (c2.include?(0) and c1.include?(4))
        if (c1.include?(0) and c2.include?(9)) or (c2.include?(0) and c1.include?(9))
          if (c1.include?(1) and c2.include?(6)) or (c2.include?(1) and c1.include?(6))
            if (c1.include?(2) and c2.include?(5)) or (c2.include?(2) and c1.include?(5))
              if (c1.include?(3) and c2.include?(6)) or (c2.include?(3) and c1.include?(6))
                if (c1.include?(4) and c2.include?(9)) or (c2.include?(4) and c1.include?(9))
                  if (c1.include?(6) and c2.include?(4)) or (c2.include?(6) and c1.include?(4))
                    if (c1.include?(8) and c2.include?(1)) or (c2.include?(8) and c1.include?(1))
                      result += 1
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

  end
end

p result