require 'brie'
require 'conjured'
require 'generic'
require 'item'
require 'sellin'
require 'tickets'

class GildedRose
  include Brie
  include Conjured
  include Generic
  include Sellin
  include Tickets

  def initialize(items)
    @items = items
  end

  def update_quality()
      @items.each do |item|
        case item.name
          when "Aged Brie" then brie item
          when "Backstage passes to a TAFKAL80ETC concert" then tickets item
          when "Conjured" then conjured item
          when "Sulfuras, Hand of Ragnaros"
          else  generic item
        end
        sell_in item
      end
  end
end
