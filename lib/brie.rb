module Brie
  def brie item
    item.quality += 1 if item.sell_in > 0
    item.quality += 2 if item.sell_in <= 0
    item.quality = 50 if item.quality > 50
  end
end
