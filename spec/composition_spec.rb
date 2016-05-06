require './models/composition'

describe Bicycle2 do
  describe '#initialize/new' do
    it 'initialize with a parts object which can be read as an attribute' do
      parts = double(:collection_of_parts)
      bicycle = described_class.new(parts)
      expect(bicycle.parts).to eq parts
    end
  end

  describe '#spares' do
    it 'returns a parts object with the parts that require spares' do
      parts = double(:collection_of_parts)
      spare_parts = double(:collection_of_spare_parts)
      allow(parts).to receive(:spare).and_return(spare_parts)
      bicycle = described_class.new(parts)
      expect(bicycle.spare).to eq spare_parts
    end
  end
end

describe Parts do
  describe '#initialize/new' do
    it 'initialize with a collection of parts stored in parts attribute' do
      part_1 = double(:part_1)
      part_2 = double(:part_2)
      parts_obj = described_class.new(part_1,part_2)
      expect(parts_obj.parts).to eq [part_1,part_2]
    end

  end
end
