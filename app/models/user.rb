class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items, dependent: :destroy
  belongs_to :brand, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments


  #変更予定
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
# フォロー状態探る（してるかしてないか
  def following?(user)
    followings.include?(user)
  end

  
  
end


# optional: true なくても保存できるように
