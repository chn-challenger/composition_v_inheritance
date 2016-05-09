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

require 'forwardable'
class Parts
  include Enumerable
  extend Forwardable
  def_delegators :@parts, :size, :each, :[]

  def initialize(parts)
    @parts = parts
  end

  def ==(parts)
    return false unless size == parts.size
    for i in 0..size-1
      return false unless parts[i] == self[i]
    end
    return true
  end

  def spares
    select{|part| part.needs_spare}
  end
end

require 'ostruct'
module PartsFactory
  def self.create_part(part_config)
    OpenStruct.new(
      name:         part_config[0],
      description:  part_config[1],
      needs_spare:  part_config.fetch(2,true))
  end

  def self.create_parts(config)
    config.collect{|part_config| create_part(part_config)}
  end

  def self.build(config,parts_class=Parts)
    parts_array = create_parts(config)
    parts_class.new(parts_array)
  end
end
