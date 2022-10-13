FactoryBot.define do
  factory :user do
    japanese_name = Gimei.name
    name { japanese_name.kanji }
    name_kana { name.katakana }
    brand
  end
end