class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :fname
      t.string :lname
      t.string :username

      t.timestamps
    end
  end
end
