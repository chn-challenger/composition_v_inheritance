class Bicycle

end

class RoadBike < Bicycle

  attr_reader :size, :tape_colour, :type, :front_shock, :rear_shock

  def initialize(args)
    @size = args[:size]
    @tape_colour = args[:tape_colour]
  end

  def spares
      {chain: '10-speed',tire_size: '23',tape_colour: tape_colour}
  end

end

class MountainBike < Bicycle

  attr_reader :size, :tape_colour, :type, :front_shock, :rear_shock

  def initialize(args)
    @size = args[:size]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def spares
      {chain: '10-speed',tire_size: '2.1',front_shock: front_shock,
        rear_shock: rear_shock}
  end

end
