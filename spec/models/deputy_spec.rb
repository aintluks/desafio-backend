require 'rails_helper'

RSpec.describe Deputy, type: :model do
  context 'relationships' do
    it { is_expected.to have_many :expenses }
  end

  context 'validations' do
    it { should validate_uniqueness_of :ide_cadastro }
    it { should validate_uniqueness_of :cpf }
  end
end
