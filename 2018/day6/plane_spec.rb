require_relative 'plane'

describe Plane do
  def p x,y
    Point.new x,y
  end

  context 'each_point' do
    it 'handles empty ranges' do
      result = []
      p = Plane.new (0..-1), (0..-1)
      p.each_point { |p| result << p }
      expect(result).to be_empty
    end

    it 'handles 1x1 ranges' do
      result = []
      pl = Plane.new (3..3), (8..8)
      pl.each_point { |pt| result << pt }
      expect(result).to eq([ p(3,8) ])
    end

    it 'handles 2x3 ranges' do
      result = []
      pl = Plane.new (3..4), (-1..1)
      pl.each_point { |pt| result << pt }
      expect(result).to eq([
          p(3,-1), p(3,0), p(3,1),
          p(4,-1), p(4,0), p(4,1)
      ])
    end
  end

  context 'border_point?' do
    let(:plane) { Plane.new (1..6), (7..12) }

    it 'outside the plane is false' do
      expect(plane.border_point? p(100,200)).to be_falsy
    end

    it 'xmin is true' do
      expect(plane.border_point? p(1,9)).to be_truthy
    end

    it 'xmax is true' do
      expect(plane.border_point? p(6,9)).to be_truthy
    end

    it 'ymin is true' do
      expect(plane.border_point? p(4,7)).to be_truthy
    end

    it 'ymax is true' do
      expect(plane.border_point? p(4,12)).to be_truthy
    end

    it 'x on border by y out of range is false' do
      expect(plane.border_point? p(1,18)).to be_falsy
    end

    it 'y on border by x out of range is false' do
      expect(plane.border_point? p(-7,12)).to be_falsy
    end
  end
end
