# [1518-11-21 00:00] Guard #1471 begins shift
# [1518-09-28 00:12] wakes up
# [1518-07-09 00:22] falls asleep

class Nap
  attr_reader :guard, :day, :start, :finish, :len

  def initialize guard, day, start, finish
    @guard, @day, @start, @finish = guard, day, start, finish
    @len = @finish - @start + 1
  end

  def to_s
    "Guard #{guard} slept on #{day} from #{start} to #{finish}"
  end
end


class GuardNaps
  attr_reader :naps, :guard, :len

  def initialize
    @naps = []
    @guard = nil
    @len = 0
  end

  def << nap
    @naps << nap
    @guard = nap.guard
    @len += nap.len
  end
end


def create_chronology
  ret = []
  lines = STDIN.read.split("\n").sort
  guard = day = start = nil # set scope
  lines.each do |line|
    if /Guard #(\d+)/ =~ line
      guard = $1.to_i
    elsif /\[(\d{4}-\d{2}-\d{2}) 00:(\d{2})\] falls asleep/ =~ line
      day = $1
      start = $2.to_i
    elsif /00:(\d\d)\] wakes up/ =~ line
      ret << Nap.new(guard, day, start, $1.to_i - 1)
    else
      raise "can't parse line from file: #{line}"
    end
  end
  ret
end
