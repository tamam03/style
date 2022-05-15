class Room < ApplicationRecord
  # チャット部屋は複数のユーザーとチャットを持つ
  has_many :users, through: :user_rooms
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
end
