require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) { build(:product) }

  context 'should' do

    it 'have title' do
      product.title = nil
      expect(product.valid?).to be false
      expect(product.errors[:title]).not_to be_empty
    end

    it 'have desc' do
      product.desc = nil
      expect(product.valid?).to be false
      expect(product.errors[:desc]).not_to be_empty
    end

  end

end
