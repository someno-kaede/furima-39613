FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    first_name            {Gimei.name.last.kanji}
    last_name             {Gimei.name.first.kanji}
    reading_first_name    {Gimei.name.last.katakana}
    reading_last_name     {Gimei.name.first.katakana}
    birthday              {Faker::Date.between(from: 30.year.ago, to: 10.days.ago)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
