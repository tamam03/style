class Room < ApplicationRecord
  # チャット部屋は複数のユーザーとチャットを持つ
  has_many :entries, dependent: :destroy
  # 先に定義
  # has_many :users, through: :user_rooms
  has_many :messages, dependent: :destroy
end
