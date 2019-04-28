class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :title
      t.integer :storage_time

      t.timestamps
    end
  end
end