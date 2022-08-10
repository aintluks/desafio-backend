require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'relationships' do
    it { is_expected.to belong_to :deputy }
  end

  context 'scopes' do
    let!(:deputy) { create(:deputy, :with_expenses) }

    describe '.find_by_deputy_id' do
      it { expect(described_class.find_by_deputy_id(deputy.id)).to match_array(deputy.expenses) }
    end
  end
end
