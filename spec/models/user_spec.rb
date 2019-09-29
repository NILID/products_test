require 'rails_helper'

describe User do
  let(:user) { build(:user) }

  context 'should' do

    it 'have default role by default' do
      expect(user.roles).to eq(['default'])
    end

    it 'have many roles' do
      user.roles = %w[default admin]
      expect(user.valid?).to be true
      expect(user.errors).to be_empty
    end
  end
end
