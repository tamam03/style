class Notification < ApplicationRecord

  default_scope -> { order(created_at: :desc) }
  # 投稿紐づける場合オプション削除
  belongs_to :item, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :visited, class_name: 'User', optional: true
  
  
end
