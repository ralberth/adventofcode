require_relative 'point'

describe Point do

  context 'taxicab_distance' do
    [
      [ 'same point',             5, -2,    5, -2,    0 ],
      [ 'origin',                 0,  0,    0,  0,    0 ],
      [ 'origin to upper-left',   0,  0,   -5,  2,    7 ],
      [ 'origin to upper-right',  0,  0,    5,  2,    7 ],
      [ 'origin to lower-left',   0,  0,   -5, -2,    7 ],
      [ 'origin to lower-right',  0,  0,    5, -2,    7 ],
      [ 'LR cross to UR',         3, -4,    6,  2,    9 ],
      [ 'LR cross to UL',         3, -4,   -6,  2,   15 ],
      [ 'LR cross to LL',         3, -4,   -6, -2,   11 ]
    ].each do |title, x1, y1, x2, y2, expected|
      it title do
        dist = Point.new(x1, y1).taxicab_dist(Point.new(x2, y2))
        expect(dist).to eq(expected)
      end
    end
  end

  context 'single_closest_point' do
    [
      [ 'empty points',     [5,2],   [ ],                                     nil   ],
      [ 'origin to origin', [0,0],   [ [0,0],   [1,1], [2,2]              ],  [0,0] ],
      [ 'one closest',      [5,2],   [ [10,11], [4,4], [11,10], [-10,-11] ],  [4,4] ],
      [ 'two closest',      [5,2],   [ [10,11], [4,4], [11,10], [4,4]     ],   nil  ],
      [ 'all closest',      [5,2],   [ [4,4],   [4,4], [4,4],   [4,4]     ],   nil  ]
    ].each do |label, start, points, expected|
      it label do
        points = points.collect { |p| Point.new p[0], p[1] }
        min_point = Point.new(start[0], start[1]).single_closest_point(points)
        if expected.nil?
          expect(min_point).to be_nil
        else
          expect(min_point).to eq(Point.new(expected[0], expected[1]))
        end
      end
    end
  end
end
