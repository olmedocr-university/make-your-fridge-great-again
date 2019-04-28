json.extract! product, :id, :name, :owner_id, :purchase_date, :expiration_date, :category_id, :food_id, :amount, :units
json.url product_url(product, format: :json)
