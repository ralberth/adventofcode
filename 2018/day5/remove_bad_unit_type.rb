require_relative 'reduce'

polymer = ARGV.length == 1 ? ARGV[0] : STDIN.read.chomp
shortest_len = polymer.length + 10
shortest_letter = nil
"a".upto("z") do |letter|
  redacted_polymer = polymer.gsub(letter, '').gsub(letter.upcase, '')
  reduced = reduce_polymer(redacted_polymer)
  # puts "Redact #{letter}: #{reduced}"
  if reduced.length < shortest_len
    shortest_len = reduced.length
    shortest_letter = letter
  end
end

puts "Shortest len=#{shortest_len} when redacting type #{shortest_letter}"
