require 'conjured'
require 'item'

describe "Conjured" do
  before (:each) do
    class Test
      include Conjured
      def initialize item
        @item = item
      end
      def update
       conjured @item
     end
    end
  end

  it "reduces quality by two" do
    conj = Item.new("conjured",10,10)
    Test.new(conj).update
    expect(conj.quality).to eq(8)
  end

  it "reduces the quality by four once the sell-by date has passed " do
    conj = Item.new("conjured",-1, 10)
    Test.new(conj).update
    expect(conj.quality).to eq(6)
  end

  it "the quality of a conjured item never goes below 0 " do
    conj = Item.new("conjured",-1, 2)
    Test.new(conj).update
    expect(conj.quality).to eq(2)
  end
end
