FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.characters(number: 10) }
    user
    item
  end
end
