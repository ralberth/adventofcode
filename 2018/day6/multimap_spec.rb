require_relative 'multimap'

describe Multimap do
  it "empty map" do
    m = Multimap.new
    expect(m.keys).to be_empty
  end

  it "keys" do
    m = Multimap.new.put(12, 1).put(12,2).put(12,3).put(13,4).put(12,5)
    expect(m.keys).to eq([ 12, 13 ])
  end

  it "values empty" do
    expect(Multimap.new.values(12)).to be_empty
  end

  it "each_value" do
    m = Multimap.new.put(12, 1).put(12, 2).put(12, 3).put(13, 4).put(12, 5)
    expect(m.values(12)).to eq([ 1, 2, 3, 5 ])
  end
end
