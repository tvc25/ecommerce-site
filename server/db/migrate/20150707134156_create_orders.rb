class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_reference
      t.integer :amount
      t.string :customer_id

      t.timestamps null: false
    end
  end
end
