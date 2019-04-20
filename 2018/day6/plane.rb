require_relative 'point'

class Plane
  def initialize xrng, yrng
    @xrng = xrng
    @yrng = yrng
  end

  def each_point
    @xrng.each do |x|
      @yrng.each do |y|
        yield Point.new(x, y)
      end
    end
  end

  def border_point? p
    ((p.x == @xrng.min or p.x == @xrng.max) and @yrng === p.y) or
    ((p.y == @yrng.min or p.y == @yrng.max) and @xrng === p.x)
  end

  def to_s
    "Plane(#{@xrng},#{@yrng})"
  end
end
