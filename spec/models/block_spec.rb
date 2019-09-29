require 'rails_helper'

RSpec.describe Block, type: :model do
  let(:block) { build(:block) }

  context 'should' do

    it 'have title' do
      block.title = nil
      expect(block.valid?).to be false
      expect(block.errors[:title]).not_to be_empty
    end

    it 'have content' do
      block.content = nil
      expect(block.valid?).to be false
      expect(block.errors[:content]).not_to be_empty
    end

    it 'have position' do
      block.position = nil
      expect(block.valid?).to be false
      expect(block.errors[:position]).not_to be_empty
    end

    it 'have type' do
      block.mark = nil
      expect(block.valid?).to be false
      expect(block.errors[:mark]).not_to be_empty
    end

    it 'have type only from TYPES list' do
      block.mark = 'business'
      expect(block.valid?).to be false
      expect(block.errors[:mark]).not_to be_empty
      expect(Block::MARKS).not_to include(block.mark)
    end
  end
end
