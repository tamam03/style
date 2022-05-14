class Item < ApplicationRecord

  enum status: {
    close: 0,
    release: 1,
    only_clerk: 2
  }

  has_one_attached :item_image

  belongs_to :user
  belongs_to :brand

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end


end
