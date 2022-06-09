class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :sentence, presence: true
end
