class CreateTagMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_maps do |t|
      t.references :item, null: false, foreign_key: true
      t.references :item_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
