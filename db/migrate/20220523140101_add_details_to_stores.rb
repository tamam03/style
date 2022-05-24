class AddDetailsToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :brand_id, :integer

    add_column :stores, :user_id, :integer
  end
end
