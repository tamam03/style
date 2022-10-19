class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # 同じユーザーは同じ投稿のいいねのデータもたせない
  validates_uniqueness_of :item_id, scope: :user_id
end
