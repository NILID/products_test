require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) { build(:product) }

  context 'should' do

    it 'have title' do
      product.title = nil
      expect(product.valid?).to be false
      expect(product.errors[:title]).not_to be_empty
    end

    it 'have os only from OS list' do
      product.os = 'linux'
      expect(product.valid?).to be false
      expect(product.errors[:os]).not_to be_empty
      expect(Product::OS).not_to include(product.os)
    end

    it 'have domain only from DOMAINS list' do
      product.domain = 'another domain'
      expect(product.valid?).to be false
      expect(product.errors[:domain]).not_to be_empty
      expect(Product::DOMAINS).not_to include(product.domain)
    end

    it 'have device only from DEVICES list' do
      product.device = 'holodilnik'
      expect(product.valid?).to be false
      expect(product.errors[:device]).not_to be_empty
      expect(Product::DEVICES).not_to include(product.device)
    end

  end
end
