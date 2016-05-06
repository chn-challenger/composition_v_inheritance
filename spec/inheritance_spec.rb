require './models/inheritance'

describe Bicycle do
  # describe '#initialize/new' do
  #   context 'it initializes with a size and tape colour' do
  #     shared_context 'bicycle initialize' do
  #       before(:all) do
  #         @bicycle = described_class.new(size: 'M', tape_colour: 'yellow',
  #           type: 'roadbike')
  #       end
  #     end
  #
  #     include_context 'bicycle initialize'
  #
  #     xit 'initializes with a size which can be read as an attribute' do
  #       expect(@bicycle.size).to eq 'M'
  #     end
  #
  #     xit 'initializes with a size which can be read as an attribute' do
  #       expect(@bicycle.tape_colour).to eq 'yellow'
  #     end
  #   end
  # end
  #
  # describe '#spare' do
  #   before(:each) do
  #     @road_bike = described_class.new(size: 'M',tape_colour: 'yellow',
  #       type: 'roadbike')
  #     @mountain_bike = described_class.new(size: 'L',front_shock: 'Shimano',
  #       rear_shock:'Continental', type: 'mountainbike')
  #   end
  #
  #   xit 'returns a hash of required spare parts for a road bike' do
  #     expected_spares = {chain: '10-speed',tire_size: '23',tape_colour: 'yellow'}
  #     expect(@road_bike.spares).to eq expected_spares
  #   end
  #
  #   xit 'returns a hash of required spare parts for a mountain bike' do
  #     expected_spares = {chain: '10-speed',tire_size: '2.1',front_shock: 'Shimano',
  #       rear_shock:'Continental'}
  #     expect(@mountain_bike.spares).to eq expected_spares
  #   end
  # end
end

describe RoadBike do
  describe '#initialize/new' do
    context 'it initializes with a size and tape_colour' do
      shared_context 'road_bike initialize' do
        before(:all) do
          @bicycle = described_class.new(size: 'M', tape_colour: 'yellow')
        end
      end

      include_context 'road_bike initialize'

      it 'initializes with a size which can be read as an attribute' do
        expect(@bicycle.size).to eq 'M'
      end

      it 'initializes with a tape colour which can be read as an attribute' do
        expect(@bicycle.tape_colour).to eq 'yellow'
      end
    end
  end

  describe '#spare' do
    before(:each) do
      @road_bike = described_class.new(size: 'M',tape_colour: 'yellow')
    end

    it 'returns a hash of required spare parts for a road bike' do
      expected_spares = {chain: '10-speed',tire_size: '23',tape_colour: 'yellow'}
      expect(@road_bike.spares).to eq expected_spares
    end
  end
end

describe MountainBike do
  describe '#initialize/new' do
    context 'it initializes with a size and shocks' do
      shared_context 'mountain_bike initialize' do
        before(:all) do
          @mountain_bike = described_class.new(size: 'M', front_shock: 'Shimano',
            rear_shock: 'Continental')
        end
      end

      include_context 'mountain_bike initialize'

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
  end

  describe '#spare' do
    before(:each) do
      @mountain_bike = described_class.new(size: 'M', front_shock: 'Shimano',
        rear_shock: 'Continental')
    end

    it 'returns a hash of required spare parts for a mountain bike' do
      expected_spares = {chain: '10-speed',tire_size: '2.1',front_shock: 'Shimano',
        rear_shock: 'Continental'}
      expect(@mountain_bike.spares).to eq expected_spares
    end
  end
end
