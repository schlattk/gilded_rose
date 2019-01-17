module Conjured
  def conjured (item)
    if item.sell_in >= 0 && item.quality >= 2
      item.quality -= 2
    else
      item.quality -= 4 if item.quality >= 4
    end
  end
end
