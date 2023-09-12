FactoryBot.define do
  factory :address do
    association :purchase
    post_code           {123-4567}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    municipalities      {Faker::String.random(length: 3..12)}
    area                {Faker::String.random(length: 3..12)}
    building_name       {Faker::String.random(length: 3..12)}
    telephone           {Faker::Number.number(digits: 10)}

  end
end
