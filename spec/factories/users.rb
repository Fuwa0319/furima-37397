FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    birthdate             {Faker::Date.between(from: '1930-01-01', to: '2017-12-31').strftime("%Y-%m-%d")}
  end
end
