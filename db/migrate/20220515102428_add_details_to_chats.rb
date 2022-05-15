class AddDetailsToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :room_id, :integer, null: false
  end
end
