class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :text
      t.integer :status, default: 0
      t.integer :brand_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
