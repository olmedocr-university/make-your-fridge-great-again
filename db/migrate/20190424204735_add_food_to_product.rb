class AddFoodToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :food, foreign_key: true
  end
end
