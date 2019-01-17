require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("generic", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "generic"
    end

    it "reduces quality of generic items by one" do
      items = [Item.new("generic",10,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(9)
    end

    it "reduces sellin of generic items by one" do
      items = [Item.new("generic",10,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(9)
    end

    it "reduces the quality by two once the sell-by date has passed " do
      items = [Item.new("generic",0,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end

    it "the quality of an item never goes below 0 " do
      items = [Item.new("generic",10,0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it "does not change quality of Sulfuras " do
      items = [Item.new("Sulfuras, Hand of Ragnaros",10,80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(80)
    end

    it "does not change sellin of Sulfuras " do
      items = [Item.new("Sulfuras, Hand of Ragnaros",10,80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(10)
    end

    it "decreases the sellin of Aged Brie by 1 " do
      items = [Item.new("Aged Brie",10,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(9)
    end

    it "increases the quality of Aged Brie by 1 " do
      items = [Item.new("Aged Brie",10,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(11)
    end


    it "does not increase quality to more than 50 " do
      items = [Item.new("Aged Brie",10,50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end

    it "increases the quality of Backstage Passes " do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",20,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(11)
    end

    it "increases the quality of Backstage Passes by 2 when expiry is 10 or lower " do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",10,10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(12)
    end

    it "increases the quality of Backstage Passes by 3 when expiry is 5 or lower" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",5,5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end

    it "after the concert quality of backstage passes falls to 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",0,5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it "does not increase quality to more than 50" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",10,50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
  end

end
