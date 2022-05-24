class Brand < ApplicationRecord

  has_many :users, dependent: :destroy

  has_many :items, dependent: :destroy

  has_many :stores, dependent: :destroy
end
