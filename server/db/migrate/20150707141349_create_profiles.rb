class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :email
      t.integer :customer_id
      t.string :twitter
      t.string :facebook

      t.timestamps null: false
    end
  end
end
