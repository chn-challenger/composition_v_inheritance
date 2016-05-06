require './models/inheritance'

describe Bicycle do
  describe '#initialize/new' do
    context 'it initializes with a size, tire_size and chain' do
      shared_context 'bicycle initialize' do
        before(:all) do
          @bicycle = described_class.new(size:'M',tire_size:'24',chain:'15-speed')
        end
      end

      include_context 'bicycle initialize'

      it 'initializes with a size which can be read as an attribute' do
        expect(@bicycle.size).to eq 'M'
      end

      it 'initializes with a tire_size which can be read as an attribute' do
        expect(@bicycle.tire_size).to eq '24'
      end

      it 'initializes with a chain which can be read as an attribute' do
        expect(@bicycle.chain).to eq '15-speed'
      end
    end

    context 'it initializes with default tire_size' do
      it 'no set tire size to raise error for default implementation in subclass' do
        expect{described_class.new(size:'M')}.to raise_error 'Subclass must implement'
      end
    end

    context 'it initializes with default chain' do
      it 'sets default chain when one is not provided' do
        bicycle = described_class.new(size:'M',tire_size:'24')
        expect(bicycle.chain).to eq '10-speed'
      end
    end
  end

  describe '#spare' do
    it 'returns a hash of spare parts' do
      bicycle = described_class.new(size: 'M',tire_size:'24',chain:'15-speed')
      expected_spares = {tire_size:'24',chain: '15-speed'}
      expect(bicycle.spares).to eq expected_spares
    end
  end
end

describe RoadBike do
  before(:all) do
    @road_bike = described_class.new(size: 'M',tape_colour: 'yellow')
  end

  describe '#initialize/new' do
    it 'initializes with a tape colour which can be read as an attribute' do
      expect(@road_bike.tape_colour).to eq 'yellow'
    end
  end

  describe '#spare' do
    it 'returns a hash of required spare parts for a road bike' do
      expected_spares = {chain: '10-speed',tire_size: '23',tape_colour: 'yellow'}
      expect(@road_bike.spares).to eq expected_spares
    end
  end
end

describe MountainBike do
  before(:all) do
    @mountain_bike = described_class.new(size: 'M', front_shock: 'Shimano',
      rear_shock: 'Continental')
  end

  describe '#initialize/new' do
    it 'initializes with a size which can be read as an attribute' do
      expect(@mountain_bike.size).to eq 'M'
    end

    it 'initializes with a front_shock which can be read as an attribute' do
      expect(@mountain_bike.front_shock).to eq 'Shimano'
    end

    it 'initializes with a rear_shock which can be read as an attribute' do
      expect(@mountain_bike.rear_shock).to eq 'Continental'
    end
  end

  describe '#spare' do
    it 'returns a hash of required spare parts for a mountain bike' do
      expected_spares = {chain: '10-speed',tire_size: '2.1',front_shock: 'Shimano',
        rear_shock: 'Continental'}
      expect(@mountain_bike.spares).to eq expected_spares
    end
  end
end

describe RecumbentBike do
  before(:all) do
    @recumbent_bike = described_class.new(size: 'M', saddle: 'Italia')
  end

  describe '#initialize/new' do
    it 'initializes with a size which can be read as an attribute' do
      expect(@recumbent_bike.size).to eq 'M'
    end

    it 'initializes with a saddle which can be read as an attribute' do
      expect(@recumbent_bike.saddle).to eq 'Italia'
    end
  end

  describe '#spare' do
    it 'returns a hash of required spare parts for a recumbent bike' do
      expected_spares = {chain:'10-speed',tire_size:'18',saddle:'Italia'}
      expect(@recumbent_bike.spares).to eq expected_spares
    end
  end
end
