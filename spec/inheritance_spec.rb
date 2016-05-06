require './models/inheritance'

describe Bicycle do
  describe '#initialize/new' do
    context 'it initializes with a size and tape colour' do
      shared_context 'bicycle initialize' do
        before(:all) do
          @bicycle = described_class.new(size: 'M', tape_colour: 'yellow')
        end
      end

      include_context 'bicycle initialize'

      it 'initializes with a size which can be read as an attribute' do
        expect(@bicycle.size).to eq 'M'
      end

      it 'initializes with a size which can be read as an attribute' do
        expect(@bicycle.tape_colour).to eq 'yellow'
      end
    end
  end

  describe '#spare' do
    before(:each) do
      @bicycle = described_class.new(size: 'M', tape_colour: 'yellow')
    end

    it 'returns a hash of required spare parts' do
      expected_spares = {chain: '10-speed',tire_size: '23',tape_colour: 'yellow'}
      expect(@bicycle.spares).to eq expected_spares
    end

  end
end
