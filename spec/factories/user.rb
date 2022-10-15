FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    name_kana { Faker:: Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    # japanese_name = Gimei.name
    # name { japanese_name.kanji }
    # name_kana { japanese_name.katakana }
    
    trait :true do
      is_user { true }
      nick_name { Faker::Lorem.characters(number: 5) }
    end
    
    trait :false do
      is_user { false }
      brand
      store
    end
  end
end
