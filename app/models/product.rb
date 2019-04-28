class Product < ApplicationRecord
  enum units: %i[gram
                 kilogram
                 ounce
                 pound]

  validates :name, presence: true, length: {maximum: 60}
  validates :amount, presence: true, length: {maximum: 10}
  validates :units, :purchase_date, :expiration_date, presence: true

  belongs_to :owner
  belongs_to :category
  belongs_to :food
end