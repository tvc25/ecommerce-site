class AddPriceAndAvailabilityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :integer
    add_column :products, :available, :boolean
  end
end
