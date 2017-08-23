=begin
A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for
the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

The text file, keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.
=end

class Problem79
  vet = []
  File.open("C:\\Users\\cristiano.modesto\\RubymineProjects\\ProjectEuler\\problem79_keylog.txt", "r") do |f|
    f.each_line do |line|
      vet << line[0..2].split("")
    end
  end
  caracteresPossiveis = vet.flatten.uniq.sort.join("")
  p vet, caracteresPossiveis
end