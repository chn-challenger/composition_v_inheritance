class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_items
    items.each do |item|
      item.update_item
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_item
    update_quality
    bounding_quality_value
    @sell_in -= 1 unless sell_in == 0
  end

  def update_quality
    raise 'SubClassImplement'
  end

  def bounding_quality_value
    @quality = quality_max if quality > quality_max
    @quality = quality_min if quality < quality_min
  end

  def quality_max
    50
  end

  def quality_min
    0
  end

end

class NormalItem < Item
  def update_quality
    @quality -= 1
    @quality -= 1 if sell_in == 0
  end
end

class AgedBrie < Item
  def update_quality
    @quality += 1
  end
end

class Sulfuras < Item
  def quality_max
    80
  end

  def update_quality
    @quality = 80 unless quality == 80
  end
end

class BackStagePass < Item
  def update_quality
    @quality += 1 if 10 < sell_in
    @quality += 2 if 5 < sell_in && sell_in <= 10
    @quality += 3 if 1 < sell_in && sell_in <= 5
    @quality = 0 if sell_in <= 1
  end
end

class Conjured < Item
  def update_item
    @quality -= 2
    @quality -= 2 if sell_in == 0
    @sell_in -= 1
    @quality = 0 if quality <= 0
    @sell_in = 0 if sell_in <= 0
  end
end
