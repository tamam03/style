class ChangeChatsToMessages < ActiveRecord::Migration[6.1]
  def change
    rename_table :chats, :messages
  end
end
