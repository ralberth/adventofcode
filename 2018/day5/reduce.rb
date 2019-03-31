# Easy solution is to just String#gsub in a loop until no more matches are found.
# Too simple, and not performant.
# O(n) way:
#    Single pass thru string with index number:
#    If i and i+1 react, remove i and i+1
#    i -= 1
#    loop back
#
# The "i -= 1" is critial because xxxaBbAxxx with an index on "B" will remove
# the "Bb" leaving "xxxaAxxx", bu the index number now points to the "A" instead
# of the "a".  Back up the index to "a" so you can detect the "aA" without moving
# the index pointer.

def react? a, b
  a != b && a.casecmp(b) == 0
end

def reduce_polymer polymer
  i = 0
  while i < polymer.length - 1 do
    if react? polymer[i], polymer[i+1]
      lhs = i == 0 ? '' : polymer[0..i-1]
      rhs = polymer[i+2..-1]
      #puts "Reaction at #{i}: #{polymer[i..i+1]} -- #{lhs} + #{rhs} = #{lhs+rhs}"
      polymer = lhs + rhs
      i = i == 0 ? 0 : i - 1
    else
      #puts "No reaction at #{i}: #{polymer[i..i+1]}"
      i += 1
    end
  end
  polymer
end
