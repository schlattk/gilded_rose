module Brie
  def brie item
    item.quality += 1 if item.quality < 50
  end
end
