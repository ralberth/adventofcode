class Claim
  attr_reader :id, :ul, :lr # upper-left point, lower-right point
  def initialize id, ul, lr
    @id, @ul, @lr = id, ul, lr
  end

  def to_s
    "#{id}:#{@ul}--{@lr}"
  end
end
