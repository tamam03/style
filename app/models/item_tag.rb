class ItemTag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :items, through: :tag_maps
  
  # def self.save_tag(sent_tags)
  #   current_tags = item_tags.pluck(:tag_name) unless item_tags.nil?
  #   old_tags = current_tags - sent_tags
  #   new_tags = sent_tags - current_tags
    
  #   old_tags.each do |old|
  #     item_tags.delete ItemTag.find_by(tag_name: old)
  #   end

  #   new_tags.each do |new|
  #     new_item_tag = ItemTag.find_or_create_by(tag_name: new)
  #     item_tags << new_item_tag
  #   end
  # end
end
