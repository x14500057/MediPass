require 'rails_helper'

RSpec.describe Doctor, type: :model do
  context 'Associations' do
    it 'has_many medical_records' do
      association = described_class.reflect_on_association(:medical_records)
      expect(association.macro).to eq :has_many
    end

    it 'belongs_to user' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end
  end
end