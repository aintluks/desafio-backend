FactoryBot.define do
  factory :deputy do
    tx_nome_parlamentar { Faker::Name.name }
    ide_cadastro { Faker::Code.npi }
    sg_uf { Faker::Address.state_abbr }
    sg_partido { Faker::Company.name }
    foto { Faker::Avatar.image }

    trait :with_expenses do
      after(:create) do |deputy|
        create_list(:expense, 5, deputy: deputy)
      end
    end
  end
end