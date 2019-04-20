require_relative 'utils'

MAX_RANGE = 10000

loci = get_loci(STDIN)
plane = Plane.new xrange(loci), yrange(loci)
safe_points_count = 0
plane.each_point do |p|
  total_dist = loci.map { |loci| p.taxicab_dist loci }.inject(0, :+)
  safe_points_count += 1 if total_dist < MAX_RANGE
end
puts safe_points_count
