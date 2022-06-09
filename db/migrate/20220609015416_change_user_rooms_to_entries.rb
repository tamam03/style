class ChangeUserRoomsToEntries < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_rooms, :entries
  end
end
