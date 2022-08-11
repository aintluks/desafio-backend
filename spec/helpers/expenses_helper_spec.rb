require 'rails_helper'

RSpec.describe ExpensesHelper do
  describe '.to_currency' do
    let!(:expense1) { create(:expense, vlr_liquido: nil) }
    let!(:expense2) { create(:expense, vlr_liquido: "string") }
    let!(:expense3) { create(:expense, vlr_liquido: "") }

    it 'with invalid value' do
      expect(helper.to_currency(expense1.vlr_liquido)).to eq("")
      expect(helper.to_currency(expense2.vlr_liquido)).to eq('R$0,00')
      expect(helper.to_currency(expense3.vlr_liquido)).to eq("")
    end
  end

  describe '.to_date_format' do
    let!(:expense1) { create(:expense, dat_emissao: nil) }
    let!(:expense2) { create(:expense, dat_emissao: "string") }
    let!(:expense3) { create(:expense, dat_emissao: "") }

    it 'with invalid value' do
      expect(helper.to_date_format(expense1.dat_emissao)).to eq("")
      expect(helper.to_date_format(expense2.dat_emissao)).to eq("")
      expect(helper.to_date_format(expense3.dat_emissao)).to eq("")
    end
  end

  describe '.html_class' do
    let!(:value1) { 500 }
    let!(:value2) { 404 }

    subject { helper.html_class(value1, value2) }

    it { is_expected.to eq ''}
  end
end