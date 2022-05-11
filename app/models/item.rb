class Item < ApplicationRecord

  enum status: { 
    close: 0, 
    release: 1, 
    only_clerk: 2 
  }

  belongs_to :user

  belongs_to :brand
end
