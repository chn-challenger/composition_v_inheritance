class Bicycle2

  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end

end

class Parts

  attr_reader :chain, :tire_size

  def initialize(args={})
    @chain = args[:chain] || _default_chain
    @tire_size = args[:tire_size] || _default_tire_size
    _additional_init(args)
  end

  def _additional_init(args)
  end

  def _default_tire_size
    raise 'Subclass must implement'
  end

  def _default_chain
    '10-speed'
  end

  def spares
      {tire_size:tire_size,chain:chain}.
        merge(_special_spares)
  end

  def _special_spares
    {}
  end

end

class RoadBikeParts < Parts

  attr_reader :tape_colour

  def _additional_init(args)
    @tape_colour = args[:tape_colour]
  end

  def _default_tire_size
    '23'
  end

  def _special_spares
    {tape_colour:tape_colour}
  end

end

class MountainBikeParts < Parts

  attr_reader :front_shock, :rear_shock

  def _additional_init(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def _default_tire_size
    '2.1'
  end

  def _special_spares
    {front_shock:front_shock,rear_shock:rear_shock}
  end

end
