module Tickets
  def tickets item
    case item.sell_in
      when 11..Float::INFINITY then item.quality += 1
      when 6..10  then item.quality += 2
      when 1..5 then item.quality += 3
      else item.quality = 0
    end
      if item.quality > 50
        item.quality = 50
      end
  end
end
