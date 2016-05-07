class Bicycle2

  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spare
    parts.spare
  end

end

class Parts

  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def ==(parts_obj)
    return false if self.parts.length != parts_obj.parts.length
    for i in 0..self.parts.length - 1
      return false if self.parts[i] != parts_obj.parts[i]
    end
    return true
  end

  def spare
    spare_parts = []
    parts.each do |part|
      spare_parts << part if part.need_spare?
    end
    self.class.new(spare_parts)
  end

end
