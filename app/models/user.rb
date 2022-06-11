class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image


  has_many :items, dependent: :destroy
  belongs_to :brand, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments

  # チャット機能
  has_many :entries, dependent: :destroy
  # has_many :rooms, through: :user_rooms
  has_many :messages, dependent: :destroy



  belongs_to :store , optional: true


  # フォローする→relationships
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロー受ける→reverse_of_relationships
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # relationshipsがフォロー受ける
  has_many :followings, through: :relationships, source: :followed
  # reverse_of_relationshipsがフォローする
  has_many :followers, through: :reverse_of_relationships, source: :follower




# ゼロの状態からフォローする（relationshipsにフォローできる能力をつける）
  def follow(user_id)
     relationships.create(followed_id: user_id)
  end
# relationshipsにフォロー削除能力つける（すでにフォローしているユーザー探して消す）
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
# フォロー状態探る（してるかしてないか)
  def following?(user)
    followings.include?(user)
  end


# プロフィール画像設定無い場合の画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     profile_image.variant(resize_to_limit: [width, height]).processed
  end

end




