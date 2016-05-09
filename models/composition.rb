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

# class Parts
#   attr_reader :parts
#
#   def initialize(parts)
#     @parts = parts
#   end
#
#   def spares
#     parts.select {|part| part.need_spare}
#   end
# end

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

  attr_reader :parts

  def initialize(parts,dummies)
    @parts = parts
    @dummies = dummies
  end

  def spares
    #when no object is provided in front of select, what does it take??? It appears
    #to always take the first array it find in a instance variable, is this intended
    #
    select do |part|
      p part
      true

    end
  end
end

describe Parts do
  describe '#initialize/new' do
    it 'initialize with a collection of parts stored in parts attribute' do
      # part_1 = double(:part_1)
      # part_2 = double(:part_2)
      # parts_obj = described_class.new([part_1,part_2])
      # expect(parts_obj.parts).to eq [part_1,part_2]
      chain = Part.new(name:'chain',description:'12-speed')
      tire = Part.new(name:'tire',description:'21')
      shock = Part.new(name:'shock',description:'Shimano')
      # p shock
      mountain_bike = Bicycle2.new(size: 'L', parts: Parts.new([11,12,13,14],[chain,tire,shock]))
      # p mountain_bike.parts.parts
      p mountain_bike.spares.size
      # p mountain_bike.parts.methods
    end
  end
end
