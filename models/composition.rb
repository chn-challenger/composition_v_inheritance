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

# road_config =
#   [['chain',        '10-speed'],
#    ['tire_size',    '23'],
#    ['tape_colour',  'red']]
#
# mountain_config =
#   [['chain',        '10-speed'],
#    ['tire_size',    '2.1'],
#    ['front_shock',  'Manitou', false],
#    ['rear_shock',   'Fox']]

require 'ostruct'
module PartsFactory
  def self.build(config,parts_class=Parts)
    parts_array = config.collect{|part_config| create_part(part_config)}
    parts_class.new(parts_array)
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name:         part_config[0],
      description:  part_config[1],
      needs_spare:  part_config.fetch(2,true))
  end
end
