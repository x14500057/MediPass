require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Associations' do
    it 'has_one patient' do
      association = described_class.reflect_on_association(:patient)
      expect(association.macro).to eq :has_one
      expect(association.options[:dependent]).to eq :destroy
    end

	it 'has_one doctor' do
      association = described_class.reflect_on_association(:doctor)
      expect(association.macro).to eq :has_one
      expect(association.options[:dependent]).to eq :destroy
    end

  end
end