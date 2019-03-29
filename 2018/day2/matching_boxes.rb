def common_letters s1, s2
  out = []
  0.upto(s1.length) { |i| out << s1[i] if s1[i] == s2[i] }
  out.join
end

boxes = STDIN.read.split

found = false
while !found && box1 = boxes.pop do
  boxes.each do |box2|
    common = common_letters(box1, box2)
    if common.length == box1.length - 1
      puts common
      found = true
    end
  end
end
