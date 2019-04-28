class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.date :purchase_date
      t.date :expiration_date
      t.integer :amount
      t.integer :units, default: 2

      t.timestamps
    end
  end
end
