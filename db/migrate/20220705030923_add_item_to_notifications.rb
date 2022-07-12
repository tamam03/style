class AddItemToNotifications < ActiveRecord::Migration[6.1]
  def up
    remove_index :notifications, :post_id
    add_index    :notifications, :item_id
  end

  def down
    remove_index :notifications, :post_id
    add_index    :notifications, :item_id
  end
end
