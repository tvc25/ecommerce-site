class AddPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, precision: 12, scale: 3
    add_column :products, :active, :boolean
  end
end
