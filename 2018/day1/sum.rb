# day1.rb, see https://adventofcode.com/2018/day/1

out = 0
STDIN.read.split("\n").each { |x| out += x.to_i }
puts out
