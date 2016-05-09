require './models/composition'

# describe Bicycle2 do
#   describe '#initialize/new' do
#     it 'initialize with a parts object which can be read as an attribute' do
#       parts = double(:collection_of_parts)
#       bicycle = described_class.new(parts)
#       expect(bicycle.parts).to eq parts
#     end
#   end
#
#   describe '#spares' do
#     it 'returns a parts object with the parts that require spares' do
#       parts = double(:collection_of_parts)
#       spare_parts = double(:collection_of_spare_parts)
#       allow(parts).to receive(:spare).and_return(spare_parts)
#       bicycle = described_class.new(parts)
#       expect(bicycle.spare).to eq spare_parts
#     end
#   end
# end

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
  #
  # describe '==' do
  #   it 'returns true when all parts are equal' do
  #     part_1 = double(:part_1)
  #     part_2 = double(:part_2)
  #     parts_1 = described_class.new([part_1,part_2])
  #     parts_2 = described_class.new([part_1,part_2])
  #     expect(parts_1).to eq parts_2
  #   end
  # end
  #
  # describe '#spare' do
  #   it 'returns a parts object with a collect of needed spare parts' do
  #     part_1 = double(:part_1,need_spare?:true,name:'chain',description:'10-speed')
  #     part_2 = double(:part_2,need_spare?:true,name:'tire_size',description:'21')
  #     part_3 = double(:part_3,need_spare?:false,name:'frame',description:'Specialized')
  #     parts_obj = described_class.new([part_1,part_2,part_3])
  #     spare_parts = described_class.new([part_1,part_2])
  #     expect(parts_obj.spare).to eq spare_parts
  #   end
  # end

end
