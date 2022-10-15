FactoryBot.define do
  factory :user do
    japanese_name = Gimei.name
    name { japanese_name.kanji }
    name_kana { name.katakana }
    brand
    store
  end
end

# is_userがtrueの場合
# name
# name_kana
# nick_name
# mail
# pass

# false
# name
# name_kana
# brand
# store
# mail
# pass
