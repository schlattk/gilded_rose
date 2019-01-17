require 'item'
require 'sellin'


describe "Sellin" do
  before (:each) do
    class Test
      include Sellin
      def initialize item
        @item = item
      end
      def update
       sell_in @item
     end
    end
  end

  it "decreases sell_in by one" do
    gen = Item.new("random",10,10)
    Test.new(gen).update
    expect(gen.sell_in).to eq(9)
  end

  it "decreases sell_in for Aged Brie" do
    brie = Item.new("Aged Brie",10,10)
    Test.new(brie).update
    expect(brie.sell_in).to eq(9)
  end

  it "does not change sell_in for Sulfuras" do
    sulf = Item.new("Sulfuras, Hand of Ragnaros",10,50)
    Test.new(sulf).update
    expect(sulf.sell_in).to eq(10)
  end
end
