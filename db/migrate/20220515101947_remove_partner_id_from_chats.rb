class RemovePartnerIdFromChats < ActiveRecord::Migration[6.1]
  def change
    remove_column :chats, :partner_id, :integer
  end
end
