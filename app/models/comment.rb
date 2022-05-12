class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :text, presence: true
end
