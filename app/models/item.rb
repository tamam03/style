class Item < ApplicationRecord

#公開ステータス
  enum status: {
    close: 0,
    release: 1,
    only_clerk: 2,
  }

  has_one_attached :item_image

  belongs_to :user
  belongs_to :brand

  has_many :tag_maps, dependent: :destroy
  has_many :item_tags, through: :tag_maps
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :item_image, presence: true
  validates :text, length: { maximum: 200 }

  # default_scope :order => 'created_at DESC'

#いいね通知
  def create_notification_favorite!(current_user)
    temp = Notification.where([
      "visitor_id = ? and visited_id = ? and item_id = ? and action = ? ",
      current_user.id, user_id, id, 'like'
    ])
    if temp.blank?
      notification = current_user.active_notifications.new(
        item_id: id,
        visited_id: user_id,
        action: 'favorite'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

#コメント通知
  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(item_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      item_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

#いいね機能
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

#投稿画像
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end

end
