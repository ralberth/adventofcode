# saves a 1,000 x 1,000 matrix in favor of a O(n^2) algorithm with minimal space
require 'set'
require 'point'
require 'claim'

def parse_claim line
  parts = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/.match(line).captures()
  id, x, y, w, h = parts.collect(&:to_i)
  Claim.new(id, Point.new(x, y), Point.new(x + w - 1, y + h - 1))
end

def incommon as, ae, bs, be # a start, a end, b start, b end
  case
    # a:    s----------------e           -OR-    s---------------e
    # b:            S--------------e                  S----e
    when bs >= as && bs <= ae
      bs.upto([ae, be].min).to_a

    # a:        S-----e            -OR-    S--------e
    # b:   s-----------------e          s-------e
    when as >= bs && as <= be
      as.upto([ae, be].min).to_a
    else
      []
  end
end

def overlapping_points claim1, claim2
  overlaps = Set.new
  xcommon = incommon(claim1.ul.x, claim1.lr.x, claim2.ul.x, claim2.lr.x)
  ycommon = incommon(claim1.ul.y, claim1.lr.y, claim2.ul.y, claim2.lr.y)
  xcommon.each do |x|
    ycommon.each do |y|
      overlaps << Point.new(x, y)
    end
  end
  overlaps
end

claims = STDIN.read.split("\n").collect { |x| parse_claim(x) }

points = Set.new
incomplete_claims = Set.new

claims.combination(2) do |c1, c2|
  ov = overlapping_points(c1, c2)
  points.merge(ov)
  incomplete_claims.merge([c1,c2]) if ov.size > 0
end

puts "Number of overlapping points: #{points.size}"

nonoverlapping_claims = claims.delete_if { |c| incomplete_claims.include? c }
puts "No-overlapping claims:"
nonoverlapping_claims.each { |c| puts c.id }

