FactoryBot.define do
  factory :brand do
    brand_name { Faker::Lorem.characters(number: 5) }
  end
end
