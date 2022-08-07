require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'relationships' do
    it { is_expected.to belong_to :deputy }
  end
end
