class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :message_image

  validates :sentence, presence: true

  def get_message_image(width, height)
    message_image.variant(resize_to_limit: [width, height]).processed
  end
end
