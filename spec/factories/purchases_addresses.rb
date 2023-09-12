FactoryBot.define do
  factory :purchases_addresses do
    #address
    #association :purchase
    post_code           {"123-4567"}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    municipalities      {Faker::String.random(length: 3..12)}
    area                {Faker::String.random(length: 3..12)}
    building_name       {Faker::String.random(length: 3..12)}
    telephone           {Faker::Number.number(digits: 10)}
    token               {"tok_abcdefghijk00000000000000000"}

    #purchase
    # association :user_id
    # association :product_id
  end
end
