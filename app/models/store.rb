class Store < ApplicationRecord
  
  #変更予定
  has_many :users
  
  belongs_to :brand
end
