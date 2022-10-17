FactoryBot.define do
  factory :item_tag do
    item_tag { Faker::Lorem.characters(number: 5) }
  end
end