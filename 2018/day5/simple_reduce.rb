require_relative 'reduce'

polymer = ARGV.length == 1 ? ARGV[0] : STDIN.read.chomp
reduced = reduce_polymer(polymer)
puts reduced
puts "length #{reduced.length}"
