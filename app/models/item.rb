class Item < ApplicationRecord

  enum status: {
    close: 0,
    release: 1,
    only_clerk: 2
  }

  has_one_attached :item_image

  belongs_to :user
  belongs_to :brand
  has_many :tag_maps, dependent: :destroy
  has_many :item_tags, through: :tag_maps

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end


  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     item_image.variant(resize_to_limit: [width, height]).processed
  end

  def save_tag(sent_tags)
      current_tags = self.item_tags.pluck(:tag_name) unless self.item_tags.nil?
      old_tags = current_tags - sent_tags
      new_tags = sent_tags - current_tags

      old_tags.each do |old|
        self.item_tags.delete ItemTag.find_by(tag_name: old)
      end

      new_tags.each do |new|
        new_item_tag = ItemTag.find_or_create_by(tag_name: new)
        self.item_tags << new_item_tag
      end
  end



end
