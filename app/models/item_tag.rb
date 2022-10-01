class ItemTag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'item_tag_id'
  has_many :items, through: :tag_maps


  def save_tag(sent_tags)

    current_tags = ItemTag.all.pluck(:tag_name)

    # レコードに存在するが使わないタグ
    old_tags = current_tags - sent_tags
    # 新しく生成するタグ
    new_tags = sent_tags - current_tags
    # 生成しないが使うタグ
    again_tags = current_tags - old_tags - new_tags

    tags = []
    again_tags.each do |again|
      again_item_tag = ItemTag.find_by(tag_name: again)
      tags << again_item_tag
    end

    new_tags.each do |new|
      new_item_tag = ItemTag.find_or_create_by(tag_name: new)
      tags << new_item_tag
    end
    return tags
  end

end
