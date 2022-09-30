class ItemTag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'item_tag_id'
  has_many :item, through: :tag_maps

  # タグ機能
  def save_tag(sent_tags)
    current_tags = item.pluck(:tag_name) unless item.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    tags = []

    new_tags.each do |new|
      new_item_tag = ItemTag.find_or_create_by(tag_name: new)
      tags << new_item_tag
      return tags
    end
  end
end
