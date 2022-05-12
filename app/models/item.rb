class Item < ApplicationRecord

  enum status: {
    close: 0,
    release: 1,
    only_clerk: 2
  }

  belongs_to :user
  belongs_to :brand

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end

  has_many :comments, dependent: :destroy
end
