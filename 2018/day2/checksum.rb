def exactly_n_repeated_letters? input, n
  ltr = Hash.new(0)
  input.each_char { |c| ltr[c] += 1 }
  ltr.has_value? n
end

boxes = STDIN.read.split
twice  = boxes.select { |id| exactly_n_repeated_letters? id, 2 }.count
thrice = boxes.select { |id| exactly_n_repeated_letters? id, 3 }.count
puts twice * thrice
