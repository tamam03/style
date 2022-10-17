FactoryBot.define do
  factory :user do
    japanese_name = Gimei.name
    name { japanese_name.kanji }
    name_kana { japanese_name.katakana }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    is_user { true }
    nick_name { 'aaa' }
    
    trait :false_user do
      is_user { false }
      nick_name { nil }
      brand
      store
    end
  end
end
