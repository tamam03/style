class Brand < ApplicationRecord

  has_many :users, dependent: :destroy

  has_many :items, dependent: :destroy

  has_many :stores, ->{ order(:store_name) }, dependent: :destroy
end
