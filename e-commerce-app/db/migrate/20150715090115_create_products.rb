class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :tag
      t.integer :price
      t.integer :category_id
      t.boolean :active
      t.string :description
      t.string :image

      t.timestamps null: false
    end
  end
end
