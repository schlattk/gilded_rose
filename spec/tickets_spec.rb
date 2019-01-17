require 'item'
require 'tickets'

describe "tickets" do
  before (:each) do
    class Test
      include Tickets
      def initialize item
        @item = item
      end
      def update
       tickets @item
     end
    end
  end

  it "increases the quality of Backstage Passes " do
    ticket = Item.new("Backstage passes",20,10)
    Test.new(ticket).update
    expect(ticket.quality).to eq(11)
  end

  it "increases the quality of Backstage Passes by 2 when sellin is < 10" do
    ticket = Item.new("Backstage passes",9,10)
    Test.new(ticket).update
    expect(ticket.quality).to eq(12)
  end

  it "increases the quality of Backstage Passes by 3 when expiry is 5 or lower" do
    ticket = Item.new("Backstage passes",4,10)
    Test.new(ticket).update
    expect(ticket.quality).to eq(13)
  end

  it "after the concert quality of backstage passes falls to 0" do
    ticket = Item.new("Backstage passes",0,10)
    Test.new(ticket).update
    expect(ticket.quality).to eq(0)
  end

  it "does not increase quality to more than 50" do
    ticket = Item.new("Backstage passes",4,48)
    Test.new(ticket).update
    expect(ticket.quality).to eq(50)
  end

  it "does not increase quality to more than 50" do
    ticket = Item.new("Backstage passes",8,49)
    Test.new(ticket).update
    expect(ticket.quality).to eq(50)
  end

  it "does not increase quality to more than 50" do
    ticket = Item.new("Backstage passes",15, 50)
    Test.new(ticket).update
    expect(ticket.quality).to eq(50)
  end
end
