class TagMap < ApplicationRecord
  belongs_to :item
  belongs_to :item_tag

  validates :item_id, presence: true
  validates :item_tag_id, presence: true
  
end
