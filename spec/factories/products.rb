FactoryBot.define do
  factory :product do
    association :user
    product_name        {"Faker::String.random(length: 3..12)"}
    detail              {"Faker::String.random(length: 3..12)"}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    state_id            {Faker::Number.between(from: 2, to: 7)}
    burden_id           {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id     {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    #image               {Faker::Lorem.sentence}

    after(:build) do |message|
      message.image.attach(io: File.open('FurimaER.png'), filename: 'FurimaER.png')
    end
  end
end
