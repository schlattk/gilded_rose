require 'generic'
require 'item'

describe "generic" do
  before (:each) do
    class Test
      include Generic
      def initialize item
        @item = item
      end
      def update
       generic @item
     end
    end
  end

  it "reduces quality by one" do
    generic = Item.new("generic",10,10)
    Test.new(generic).update
    expect(generic.quality).to eq(9)
  end

  it "reduces the quality by two once the sell-by date has passed " do
    generic = Item.new("generic",0,10)
    Test.new(generic).update
    expect(generic.quality).to eq(8)
  end

  it "the quality of a generic item never goes below 0 " do
    generic = Item.new("generic",10,0)
    Test.new(generic).update
    expect(generic.quality).to eq(0)
  end
end
