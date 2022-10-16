FactoryBot.define do
  factory :user do
    japanese_name = Gimei.name
    name { japanese_name.kanji }
    name_kana { japanese_name.katakana }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    
    trait :true_user do
      is_user { true }
      nick_name { 'aaa' }
    end
    
    trait :false_user do
      is_user { false }
      brand
      store
    end
  end
end
