module Generic
  def generic (item)
    if item.sell_in >= 0 && item.quality >= 1
      item.quality -= 1
    else
      item.quality -= 2 if item.quality >= 2
    end
  end
end
