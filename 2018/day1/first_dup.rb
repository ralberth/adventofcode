# day1.rb, see https://adventofcode.com/2018/day/1
require 'set'

class CircularList
  def initialize ary
    @ary = ary
    @next = 0
  end

  def each
    ok = true
    while ok do
      ok = yield @ary[@next]
      @next += 1
      @next = 0 if @next >= @ary.size
    end
  end
end

sum = 0
previous = Set.new
clist = CircularList.new STDIN.read.split.collect(&:to_i)
clist.each do |ele|
  sum += ele
  is_uniq = previous.add? sum
  puts sum if !is_uniq
  is_uniq
end
