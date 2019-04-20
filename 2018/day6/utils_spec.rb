require_relative 'utils'

describe 'utils' do

  it 'xrange' do
    points = [ p(1,5), p(2,6), p(3,4), p(2,1) ]
    expect(xrange(points)).to eq((1..3))
  end

  it 'yrange' do
    points = [ p(1,5), p(2,6), p(3,4), p(2,1) ]
    expect(yrange(points)).to eq((1..6))
  end

  context 'collect_closest_to_each_locus: ' do
    it 'single locus' do
      plane = Plane.new (1..3), (4..6)
      mm = collect_closest_to_each_locus(plane, [ p(2,5) ])
      expect(mm.keys).to eq([ p(2,5) ])
      expect(mm.values(p(2,5))).to eq([
          p(1,4), p(1,5), p(1,6),
          p(2,4), p(2,5), p(2,6),
          p(3,4), p(3,5), p(3,6)
      ])
    end

    it 'two loci' do
      plane = Plane.new (1..3), (4..6)
      mm = collect_closest_to_each_locus(plane, [ p(1,4), p(3,6) ])
      expect(mm.keys).to eq([ p(1,4), p(3,6) ])
      expect(mm.values(p(1,4))).to eq([
          p(1,4), p(1,5),
          p(2,4)
      ])
      expect(mm.values(p(3,6))).to eq([
                          p(2,6),
                  p(3,5), p(3,6)
      ])
    end

    it 'three loci' do
      plane = Plane.new (1..3), (4..6)
      mm = collect_closest_to_each_locus(plane, [ p(1,4), p(1,5), p(3,6) ])
      expect(mm.keys).to eq([ p(1,4), p(1,5), p(3,6) ])
      expect(mm.values(p(1,4))).to eq([
          p(1,4),
          p(2,4)
      ])
      expect(mm.values(p(1,5))).to eq([
                  p(1,5), p(1,6),
                  p(2,5)
      ])
      expect(mm.values(p(3,6))).to eq([
                          p(2,6),
                  p(3,5), p(3,6)
      ])
    end
  end

  context 'remove_border_points' do
    it 'leaves array alone with no border points' do
      plane = Plane.new (1..10), (1..10)
      array = [ p(2,2), p(3,3), p(4,4), p(5,5) ]
      result = remove_border_points(plane, array)
      expect(result).to eq(array)
    end

    it 'returns empty from array with only border points' do
      plane = Plane.new (1..10), (1..10)
      array = [ p(1,1), p(1,2), p(5,10), p(10,10) ]
      result = remove_border_points(plane, array)
      expect(result).to be_empty
    end

    it 'filters out border points' do
      plane = Plane.new (1..10), (1..10)
      array = [ p(1,1), p(1,2), p(5,5), p(9,9), p(2,1) ]
      result = remove_border_points(plane, array)
      expect(result).to eq([ p(5,5), p(9,9) ])
    end
  end
end
