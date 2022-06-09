class AddDetailsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :user_id, :integer
  end
end
