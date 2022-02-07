FactoryBot.define do
  factory :item do
    name              {Faker::Lorem.sentence}
    content           {Faker::Lorem.sentence}
    category_id       {Faker::Number.between(from: 2, to: 11)}
    status_id         {Faker::Number.between(from: 2, to: 7)}
    ship_charge_id    {Faker::Number.between(from: 2, to: 3)}
    prefecture_id     {Faker::Number.between(from: 1, to: 47)}
    days_to_ship_id   {Faker::Number.between(from: 2, to: 4)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end
  end
end
