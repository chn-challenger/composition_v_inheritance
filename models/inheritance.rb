class Bicycle

  attr_reader :size, :tape_colour

  def initialize(args)
    @size = args[:size]
    @tape_colour = args[:tape_colour]
  end

end
