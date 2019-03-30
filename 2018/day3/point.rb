class Point
  attr_reader :x, :y

  def initialize x, y
    @x, @y = x, y
  end

  def eql? a
    @x == a.x && @y == a.y
  end

  def hash
    to_s.hash
  end
end
