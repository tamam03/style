class Contact < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true, length: { in: 10..400 }
end
