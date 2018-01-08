=begin
In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.

131 673 234 103 18
201 96 342 965 150
630 803 746 422 111
537 699 497 121 956
805 732 524 37 331

131 -> 201 -> 96 -> 342 -> 746 -> 422 -> 121 -> 37 -> 331

Find the minimal path sum, in matrix.txt (right click and "Save Link/Target As..."), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.
=end

path = []
File.open("C:\\Ruby Files\\problem81_matrix.txt", "r") do |f|
  f.each_line do |line|
    path << line[0..line.length-2].split(",").to_a.map(&:to_i)
  end
end

#path = [
#        [131, 673, 234, 103, 18],
#        [201, 96, 342, 965, 150],
#        [630, 803, 746, 422, 111],
#        [537, 699, 497, 121, 956],
#        [805, 732, 524, 37, 331]
#       ]
       
# Correct Path: 131, 201, 96, 342, 746, 422, 121, 37, 331

# three_a = path_a.min(path_a.size / 2) -> 559529
# three_a = path_a.min(3) -> 548877

now = path[0][0]
weight = now
line_now = 0
pos_now = 0
walk = [now]
final_line = path[path.size-1][path[path.size-1].size-1]

#p "START LINE: " + walk.to_s

until now == final_line

  path_a = path[line_now]
  path_b = path[line_now + 1]
  
  three_a = path_a.min(3)
  if path_b != nil
    three_b = path_b.min(3)
  else
    three_b = [99999]
  end
  
  choice_a = path_a[pos_now + 1]
  if path_b != nil
    choice_b = path_b[pos_now]
  else
    choice_b = 9999
  end

  choice_a = 9999 if choice_a == nil
  choice_b = 9999 if choice_b == nil
  
  has_a = three_a.include?(choice_a)
  has_b = three_b.include?(choice_b)
  
  if has_a and has_b
    next_a_if_a = 9999
    next_b_if_a = 9999
    
    if choice_a != final_line and choice_b != final_line
    
      next_a_if_a = path_a[pos_now + 2]
      next_b_if_a = path_b[pos_now + 1]
      
      next_a_if_a = 9999 if next_a_if_a == nil
      next_b_if_a = 9999 if next_b_if_a == nil
    
      next_a_if_b = path_a[pos_now + 1]
      next_b_if_b = path[line_now + 2][pos_now]
      
      next_a_if_b = 9999 if next_a_if_b == nil
      next_b_if_b = 9999 if next_b_if_b == nil
    
    end
    
    poss_a = choice_a + next_a_if_a
    poss_b = choice_a + next_b_if_a
    poss_c = choice_b + next_a_if_b
    poss_d = choice_b + next_b_if_b
    
    right_choice = [poss_a, poss_b, poss_c, poss_d].min
    
    if right_choice == poss_c or right_choice == poss_d
      weight += choice_b
      line_now += 1
      walk << choice_b
      now = choice_b
    else
      weight += choice_a
      pos_now += 1
      walk << choice_a
      now = choice_a
    end
  elsif has_a
    weight += choice_a
    pos_now += 1
    walk << choice_a
    now = choice_a
  elsif has_b
    weight += choice_b
    line_now += 1
    walk << choice_b
    now = choice_b
  else
    if choice_a > choice_b
      weight += choice_b
      line_now += 1
      walk << choice_b
      now = choice_b
    else
      weight += choice_a
      pos_now += 1
      walk << choice_a
      now = choice_a
    end
  end
  
  #p "PATH A: " + choice_a.to_s + " | PATH B: " + choice_b.to_s + " | NOW: " + walk.to_s
  
end

p "PATH MADE: " + walk.to_s, "PATH SUM: " + weight.to_s