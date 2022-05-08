class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_name, null: 
      t.timestamps
    end
  end
end
