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

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare,true)
  end
end

require 'forwardable'
class Parts
  include Enumerable
  extend Forwardable
  def_delegators :@parts, :size, :each

  def initialize(parts)
    @parts = parts
  end

  def spares
    select{|part| part.needs_spare}
  end
end
