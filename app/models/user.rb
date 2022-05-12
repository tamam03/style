class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items, dependent: :destroy
  belongs_to :brand, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  

  #変更予定
  belongs_to :store , optional: true
end


# optional: true なくても保存できるように
