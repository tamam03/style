class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :brand_name,  null: false
      t.timestamps
    end
  end
end
