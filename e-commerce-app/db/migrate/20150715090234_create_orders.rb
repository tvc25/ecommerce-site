class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_reference
      t.integer :amount
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
