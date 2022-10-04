class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, uniqueness: user_id
end
