FactoryBot.define do
  factory :order_address do
    token             { 'tok_000000000000000' }
    postal_code       { '123-4567' }
    city              { Faker::Lorem.sentence }
    house_number      { Faker::Lorem.sentence }
    building_name     { Faker::Lorem.sentence }
    cell_phone_number { '09012345678' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    association :user
  end
end
