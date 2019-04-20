require_relative 'point'
require_relative 'plane'
require_relative 'multimap'

def get_loci stream_source
  stream_source.read.split("\n").collect do |line|
    parts = line.split(/ *, */)
    p(parts[0].to_i, parts[1].to_i)
  end
end

def xrange points
  xvals = points.collect { |p| p.x }
  (xvals.min .. xvals.max)
end

def yrange points
  yvals = points.collect { |p| p.y }
  (yvals.min .. yvals.max)
end

def collect_closest_to_each_locus plane, all_loci
  loci_groups = Multimap.new # Hash from locus Point object to array of Points that are close to it
  plane.each_point do |point|
    closest_locus = point.single_closest_point(all_loci)
    loci_groups.put(closest_locus, point) if closest_locus
  end
  loci_groups
end

def remove_border_points plane, point_array
  point_array.reject { |p| plane.border_point? p }
end
