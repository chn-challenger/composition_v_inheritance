class Bicycle

  attr_reader :size, :chain, :tire_size

  def initialize(args)
    @size = args[:size]
    @tire_size = args[:tire_size] || _default_tire_size
    @chain = args[:chain] || _default_chain
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

class RoadBike < Bicycle

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

class MountainBike < Bicycle

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

class RecumbentBike < Bicycle

  attr_reader :saddle

  def _additional_init(args)
    @saddle = args[:saddle]
  end

  def _default_tire_size
    '18'
  end

  def _special_spares
    {saddle:saddle}
  end

end
