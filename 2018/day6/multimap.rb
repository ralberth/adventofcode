class Multimap
  def initialize
    @map = Hash.new
  end

  def put k,v
    if @map.has_key? k
      @map[k] << v
    else
      @map[k] = [ v ]
    end
    self
  end

  def keys
    @map.keys
  end

  def values k
    @map[k] || []
  end
end
