class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :message_image

  validates :sentence, presence: true


  def get_message_image(width, height)
    # unless message_image.attached?
      # file_path = Rails.root.join('app/assets/images/no_image.jpg')
      # message_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    # end
     message_image.variant(resize_to_limit: [width, height]).processed
  end
end
