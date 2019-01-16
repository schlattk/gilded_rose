require 'brie'
require 'item'

describe "Brie" do
  before (:each) do
    class Test
      include Brie
      def initialize item
        @item = item
      end
      def update
       brie @item
     end
    end
  end

  it "increases quality by one" do
    aged_brie = Item.new("Aged Brie",10,10)
    Test.new(aged_brie).update
    expect(aged_brie.quality).to eq(11)
  end

  it "does not increase quality to more than 50" do
    aged_brie = Item.new("Aged Brie",10,50)
    Test.new(aged_brie).update
    expect(aged_brie.quality).to eq(50)
  end
end
