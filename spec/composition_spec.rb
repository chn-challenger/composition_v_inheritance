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

describe Parts do
  let(:part_1){double(:part_1)}
  let(:part_2){double(:part_2)}
  let(:parts_1){described_class.new([part_1,part_2])}
  let(:parts_2){described_class.new([part_1,part_2])}
  let(:parts_3){described_class.new([part_1])}

  describe '#initialize/new' do
    it 'initialize with an array of part objects' do
      expect{described_class.new([double(:part_1),double(:part_2)])}.not_to raise_error
    end
  end

  describe '#size' do
    it 'returns the number of part objects contained in parts' do
      expect(parts_1.size).to eq 2
    end
  end

  describe '#each' do
    it 'responds to method :each' do
      expect(parts_1).to respond_to(:each)
    end
  end

  describe '#each' do
    it 'responds to method :[]' do
      expect(parts_1).to respond_to(:[])
    end
  end

  describe '#==' do
    it 'returns true when all part objects are equal' do
      expect(parts_1).to eq parts_2
    end

    it 'returns false when two parts have different number of parts' do
      expect(parts_1).not_to eq parts_3
    end
  end

  describe '#spare' do
    it 'returns an array of spares' do
      allow(part_1).to receive(:needs_spare).and_return(true)
      allow(part_2).to receive(:needs_spare).and_return(false)
      expect(parts_1.spares).to eq [part_1]
    end
  end
end

describe PartsFactory do
  describe '#self.create_part' do
    it 'can create a part object given the object config' do
      config = ['object_name','object_description']
      expected_obj = OpenStruct.new(name:'object_name',description:
        'object_description',needs_spare:true)
      expect(described_class.create_part(config)).to eq expected_obj
    end
  end

  describe '#self.create_parts' do
    it 'can create a parts array given a configurations array' do
      config_1 = ['name_1','description_1']
      config_2 = ['name_2','description_2']
      configs = [config_1,config_2]
      allow(described_class).to receive(:create_part).with(config_1).and_return('part_1')
      allow(described_class).to receive(:create_part).with(config_2).and_return('part_2')
      expected_parts = ['part_1','part_2']
      expect(described_class.create_parts(configs)).to eq expected_parts
    end
  end

  describe '#self.build' do
    it 'can build a parts object from a given configuration and class name' do
      config_double = double(:config_double)
      allow(described_class).to receive(:create_parts).with(config_double).and_return(['parts_array'])
      expected_obj = Parts.new(['parts_array'])
      expect(described_class.build(config_double)).to eq expected_obj
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
end
