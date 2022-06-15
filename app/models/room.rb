class Room < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  def partner(user)
    entries.where.not(user: user).first.user
  end
end
