class Point
  attr_reader :x, :y

  def initialize x, y
    @x, @y = x, y
  end

  def taxicab_dist other_point
    (@x - other_point.x).abs + (@y - other_point.y).abs
  end

  # Returns element in points that has the shortest taxicab distance from start and there
  # are exactly one point in points with this minimum distance.  If there are two points
  # with the same minimum distance, nil is returned.
  def single_closest_point points
    min_dist  = nil
    min_point = nil
    points.each do |p|
      dist = taxicab_dist(p)
      if min_dist.nil? or dist < min_dist
        min_dist = dist
        min_point = p
      else
        if min_dist == dist
          return nil
        end
      end
    end
    min_point
  end

  def == a;   @x == a.x && @y == a.y; end
  def eql? a; self == a;              end
  def hash;   @x * @y;                end
  def to_s;   "${@x},${@y}";          end
end

def p x, y
  Point.new(x, y)
end
