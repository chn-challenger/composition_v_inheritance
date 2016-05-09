require './models/gilded_rose'

# describe GildedRose do
#   describe '#update_quality' do
#     context 'normal item' do
#       shared_context 'normal item' do
#         before(:all) do
#           @normal_item = Item.new('Normal Rose',15,25)
#           @gilded_rose = described_class.new([@normal_item])
#           @gilded_rose.update_quality
#         end
#       end
#
#       include_context 'normal item'
#
#       it 'updates the sell_in value of a normal item' do
#         expect(@normal_item.sell_in).to eq 14
#       end
#
#       it 'updates the quality value of a normal item' do
#         expect(@normal_item.quality).to eq 24
#       end
#
#     end
#   end
# end

describe NormalItem do
  describe '#update_item' do
    context 'normal item normal circumstance' do
      shared_context 'normal circumstance' do
        before(:all) do
          @normal_item = NormalItem.new('Normal Rose',15,25)
          @normal_item.update_item
        end
      end

      include_context 'normal circumstance'

      it 'updates the sell_in value of a normal item' do
        expect(@normal_item.sell_in).to eq 14
      end

      it 'updates the quality value of a normal item' do
        expect(@normal_item.quality).to eq 24
      end
    end

    context 'normal item zero quality' do
      shared_context 'zero quality' do
        before(:all) do
          @normal_item = NormalItem.new('Normal Rose',15,0)
          @normal_item.update_item
        end
      end

      include_context 'zero quality'

      it 'updates the sell_in value of a normal item' do
        expect(@normal_item.sell_in).to eq 14
      end

      it 'updates the quality value of a normal item' do
        expect(@normal_item.quality).to eq 0
      end
    end

    context 'normal item zero sell_in non-zero quality' do
      shared_context 'zero sell_in non-zero quality' do
        before(:all) do
          @normal_item = NormalItem.new('Normal Rose',0,16)
          @normal_item.update_item
        end
      end

      include_context 'zero sell_in non-zero quality'

      it 'updates the sell_in value of a normal item' do
        expect(@normal_item.sell_in).to eq 0
      end

      it 'updates the quality value of a normal item' do
        expect(@normal_item.quality).to eq 14
      end
    end

    context 'normal item zero both' do
      shared_context 'zero both' do
        before(:all) do
          @normal_item = NormalItem.new('Normal Rose',0,0)
          @normal_item.update_item
        end
      end

      include_context 'zero both'

      it 'updates the sell_in value of a normal item' do
        expect(@normal_item.sell_in).to eq 0
      end

      it 'updates the quality value of a normal item' do
        expect(@normal_item.quality).to eq 0
      end
    end
  end
end

describe AgedBrie do
  describe '#update_item' do
    context 'normal circumstance' do
      shared_context 'normal circumstance' do
        before(:all) do
          @item = described_class.new('Aged Brie',15,25)
          @item.update_item
        end
      end

      include_context 'normal circumstance'

      it 'updates the sell_in value of a normal item' do
        expect(@item.sell_in).to eq 14
      end

      it 'updates the quality value of a normal item' do
        expect(@item.quality).to eq 26
      end
    end

    context 'zero sell_in' do
      shared_context 'zero sell_in' do
        before(:all) do
          @item = described_class.new('Aged Brie',0,25)
          @item.update_item
        end
      end

      include_context 'zero sell_in'

      it 'updates the sell_in value of a normal item' do
        expect(@item.sell_in).to eq 0
      end

      it 'updates the quality value of a normal item' do
        expect(@item.quality).to eq 26
      end
    end

    context '50 quality' do
      shared_context '50 quality' do
        before(:all) do
          @item = described_class.new('Aged Brie',10,50)
          @item.update_item
        end
      end

      include_context '50 quality'

      it 'updates the sell_in value of a normal item' do
        expect(@item.sell_in).to eq 9
      end

      it 'updates the quality value of a normal item' do
        expect(@item.quality).to eq 50
      end
    end
  end
end

describe Sulfuras do
  describe '#update_item' do
    it 'set quality to 80 if it is not already 80' do
      item = described_class.new('Sulfuras',15,60)
      item.update_item
      expect(item.quality).to eq 80
    end

    it 'does not change quality if it is 80 already' do
      item = described_class.new('Sulfuras',15,80)
      item.update_item
      expect(item.quality).to eq 80
    end
  end
end

describe BackStagePass do
  # describe '#update_item' do
  #   it 'set quality to 80 if it is not already 80' do
  #     item = described_class.new('Sulfuras',15,60)
  #     item.update_item
  #     expect(item.quality).to eq 80
  #   end
  #
  #   it 'does not change quality if it is 80 already' do
  #     item = described_class.new('Sulfuras',15,80)
  #     item.update_item
  #     expect(item.quality).to eq 80
  #   end
  # end
end