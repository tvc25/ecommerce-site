class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :first-line
      t.string :second-line
      t.string :city
      t.string :postCode
      t.string :d.o.b

      t.timestamps null: false
    end
  end
end
