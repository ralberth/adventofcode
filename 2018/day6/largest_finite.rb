require_relative 'utils'

# General algorithm:
# Loop over every point in the plane:
#    Figure out if there is a single locus it is closest to
#       Add it to that locus.
# For each locus:
#    Count the points that aren't on the edge of the plane.
# Pick the locus with the highest count.

loci = get_loci(STDIN)
plane = Plane.new xrange(loci), yrange(loci)
multimap = collect_closest_to_each_locus(plane, loci)
puts multimap.
        keys.
        collect { |loci| remove_border_points(plane, multimap.values(loci)).size }.
        max
