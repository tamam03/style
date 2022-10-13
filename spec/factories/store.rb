FactoryBot.define do
  factory :store do
    store_name { Faker::Lorem.characters(number: 5) }
    brand
  end
end
