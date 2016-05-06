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

  def initialize(*part)
    @parts = *part
  end

  # def spare
  #   spare_parts = []
  #   parts.each do |part|
  #
  #   end
  # end

end
