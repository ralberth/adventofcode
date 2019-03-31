require_relative 'nap'

naps = create_chronology
guards = Hash.new
naps.each do |n|
  guards[n.guard] = GuardNaps.new unless guards.include?(n.guard)
  guards[n.guard] << n
end

sleepiest_guard_naps = guards.values.max { |x, y| x.len <=> y.len }
# puts "MAX is #{sleepiest_guard_naps.guard} with #{sleepiest_guard_naps.len}"

# guards.each do |k,v|
#   puts "#{k}, len=#{v.len}:"
#   v.naps.each do |n|
#     puts "    #{n.len}"
#   end
# end

naps_per_minute = Hash.new(0) # key = minute, val = number of naps during that minute
sleepiest_guard_naps.naps.each do |n|
  n.start.upto(n.finish) { |minute| naps_per_minute[minute] += 1 }
end

maxminute = -1
maxcount = 0
naps_per_minute.each do |k,v|
  if v > maxcount
    maxcount = v
    maxminute = k
  end
end

puts "Guard = #{sleepiest_guard_naps.guard}"
puts "minute with most naps = #{maxminute}"
puts "multiplied together: #{sleepiest_guard_naps.guard * maxminute}"
