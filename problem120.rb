=begin
Let r be the remainder when (a−1)^n + (a+1)^n is divided by a².

For example, if a = 7 and n = 3, then r = 42: 6³ + 8³ = 728 ≡ 42 mod 49. And as n varies, so too will r, but for a = 7 it turns out that rmax = 42.

For 3 ≤ a ≤ 1000, find ∑ rmax.
=end

rmax = 0
for a in 3..1000
  rm = 0
  for n in 1..2000
    r = ((a - 1)**n + (a + 1)**n).remainder(a**2)
    rm = r if rm < r
  end
  rmax += rm
end

p rmax

# 10:   9_007_628
# 100:  97_759_422
# 1000: 332_944_222
# 2000: 333_082_500