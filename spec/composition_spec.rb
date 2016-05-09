require './models/composition'

describe Bicycle2 do
  before(:each) do
    @parts = double(:parts)
    @size = double(:size)
    @bicycle = described_class.new(parts:@parts,size:@size)
  end

  describe '#initialize/new' do
    it 'initialize with a parts object which can be read as an attribute' do
      expect(@bicycle.parts).to eq @parts
    end

    it 'initialize with a size object which can be read as an attribute' do
      expect(@bicycle.size).to eq @size
    end
  end

  describe '#spares' do
    it 'returns a parts object with the parts that require spares' do
      spare_parts = double(:spare_parts)
      allow(@parts).to receive(:spares).and_return(spare_parts)
      expect(@bicycle.spares).to eq spare_parts
    end
  end
end

# describe Parts do
#   describe '#initialize/new' do
#     it 'initialize with a collection of parts stored in parts attribute' do
#       # part_1 = double(:part_1)
#       # part_2 = double(:part_2)
#       # parts_obj = described_class.new([part_1,part_2])
#       # expect(parts_obj.parts).to eq [part_1,part_2]
#       chain = Part.new(name:'chain',description:'12-speed')
#       tire = Part.new(name:'tire',description:'21')
#       shock = Part.new(name:'shock',description:'Shimano')
#       # p shock
#       mountain_bike = Bicycle2.new(size: 'L', parts: Parts.new([chain,tire,shock]))
#       # mountain_bike.parts = [1,2,3]
#       # p mountain_bike.partss
#       # p mountain_bike.spares.size
#       # p mountain_bike.parts.size
#
#       road_config =
#         [['chain',        '10-speed'],
#          ['tire_size',    '23'],
#          ['tape_colour',  'red']]
#
#       mountain_config =
#         [['chain',        '10-speed'],
#          ['tire_size',    '2.1'],
#          ['front_shock',  'Manitou', false],
#          ['rear_shock',   'Fox']]
#
#
#       road_parts = PartsFactory.build(road_config)
#       road_bike = Bicycle2.new(size:'L', parts: road_parts)
#       p road_bike
#     end
#   end
#   #
#   # describe '==' do
#   #   it 'returns true when all parts are equal' do
#   #     part_1 = double(:part_1)
#   #     part_2 = double(:part_2)
#   #     parts_1 = described_class.new([part_1,part_2])
#   #     parts_2 = described_class.new([part_1,part_2])
#   #     expect(parts_1).to eq parts_2
#   #   end
#   # end
#   #
#   # describe '#spare' do
#   #   it 'returns a parts object with a collect of needed spare parts' do
#   #     part_1 = double(:part_1,need_spare?:true,name:'chain',description:'10-speed')
#   #     part_2 = double(:part_2,need_spare?:true,name:'tire_size',description:'21')
#   #     part_3 = double(:part_3,need_spare?:false,name:'frame',description:'Specialized')
#   #     parts_obj = described_class.new([part_1,part_2,part_3])
#   #     spare_parts = described_class.new([part_1,part_2])
#   #     expect(parts_obj.spare).to eq spare_parts
#   #   end
#   # end
#
# end
