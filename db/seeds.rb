# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者アカウント
Admin.create!(
    email: "admin@example.com",
    password: "000000"
)

#ブランド初期データ
brands = ["CELFORD", "SNIDEL", "Rirandture", "Lily Brown", "FRAYI.D"]
brands.each do |brand|
  Brand.create!(brand_name: brand)
end

# 店舗初期データ
Store.create!(
  [
    {
      store_name: "銀座店",
      brand_id: 1
    },
    {
      store_name: "東京店",
      brand_id: 1
    },
    {
      store_name: "渋谷店",
      brand_id: 1
    },
    {
      store_name: "横浜店",
      brand_id: 1
    },
    {
      store_name: "六本木店",
      brand_id: 2
    },
    {
      store_name: "恵比寿店",
      brand_id: 2
    },
    {
      store_name: "博多店",
      brand_id: 2
    },
    {
      store_name: "新宿店",
      brand_id: 3
    },
    {
      store_name: "目黒店",
      brand_id: 4
    },
    {
      store_name: "千葉店",
      brand_id: 5
    }
  ]
)

# ユーザー初期データ("true・ユーザ｜false・店舗スタッフ")
# User.create!(
#   [
#     {
#       email: "true@example.com",
#       password: "000000",
#       is_user: true,
#       name: "山田花子",
#       name_kana: "ヤマダハナコ",
#       nick_name: "テストはなこ"
#     },
#     {
#       email: "false@example.com",
#       password: "000000",
#       is_user: false,
#       name: "山田森子",
#       name_kana: "ヤマダモリコ",
#       brand_id: 1,
#       store_id: 1
#     }
#   ]
# )


