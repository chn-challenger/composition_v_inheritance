class Bicycle

end

class RoadBike < Bicycle

  attr_reader :size, :tape_colour, :type, :front_shock, :rear_shock

  def initialize(args)
    @size = args[:size]
    @tape_colour = args[:tape_colour]
    @type = args[:type]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def spares
    # case type
    # when 'roadbike'
    #   {chain: '10-speed',tire_size: '23',tape_colour: tape_colour}
    # when 'mountainbike'
    #   {chain: '10-speed',tire_size: '2.1',front_shock: front_shock,
    #     rear_shock: rear_shock}
    # end
      {chain: '10-speed',tire_size: '23',tape_colour: tape_colour}
  end

end
