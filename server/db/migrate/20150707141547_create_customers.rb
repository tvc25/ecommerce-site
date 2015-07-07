class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_line
      t.string :second_line
      t.string :city
      t.string :postCode
      t.string :d_o_b

      t.timestamps null: false
    end
  end
end
