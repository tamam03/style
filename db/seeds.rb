# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@example.com", password: "000000")

# brands = %w(CELFORD SNIDEL Rirandture Lily Brown FRAYI.D)
# brands.each do |brand|
#   Brand.find_or_create_by(brand_name: brand)
# end

# stores = %w(東京店 渋谷店 新宿店 恵比寿店 銀座店)
# stores.each do |store|
#   Store.find_or_create_by(store_name: store)
# end