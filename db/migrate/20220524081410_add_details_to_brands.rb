class AddDetailsToBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :user_id, :integer
    add_column :brands, :store_id, :integer
  end
end
