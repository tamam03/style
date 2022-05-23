class AddDetailsToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :brand_id, :integer
  end
end
