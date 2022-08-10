FactoryBot.define do
  factory :expense do
    association :deputy, factory: :deputy

    dat_emissao { Faker::Date.between(from: 2.years.ago, to: Date.today) }
    txt_fornecedor { Faker::Company.industry }
    vlr_liquido { Faker::Number.decimal(l_digits: 2) }
    url_documento { Faker::Avatar.image }
  end
end