class Store < ApplicationRecord
  
  has_many :users, dependent: :destroy
  belongs_to :brand
  
  validates :store_name, presence: true
  validates :brand_id, presence: true
end
