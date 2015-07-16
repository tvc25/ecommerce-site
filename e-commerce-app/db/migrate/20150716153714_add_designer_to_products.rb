class AddDesignerToProducts < ActiveRecord::Migration
  def change
    add_column :products, :designer, :string
  end
end
