class ItemTag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'item_tag_id'
  has_many :items, through: :tag_maps


  def save_tag(sent_tags)
    # すでに存在するタグを取得
    current_tags = items.pluck(:tag_name) unless items.nil?
    # 存在しない新しく追加するタグを取得
    new_tags = sent_tags - current_tags
    # データベース保存プラス変数代入し配列で返す
    tags = []
    new_tags.each do |new|
      new_item_tag = ItemTag.find_or_create_by(tag_name: new)

      tags << new_item_tag

      return tags
    end
  end

end
