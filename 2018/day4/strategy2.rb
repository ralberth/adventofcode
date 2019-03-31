require_relative 'nap'

naps = create_chronology
guard_minute = Hash.new(0)
naps.each do |n|
  n.start.upto(n.finish) do |min|
    guard_minute["#{n.guard} #{min}"] += 1
  end
end

maxcount = -1
guard = -1
minute = -1
guard_minute.each do |gm, count|
  if count > maxcount
    maxcount = count
    guard, minute = gm.split
    guard = guard.to_i
    minute = minute.to_i
  end
end

puts "Guard #{guard} * minute #{minute} = #{guard * minute}"
