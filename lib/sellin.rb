module Sellin
 def sell_in item
   item.sell_in -= 1 if item.name != "Sulfuras, Hand of Ragnaros"
 end
end
