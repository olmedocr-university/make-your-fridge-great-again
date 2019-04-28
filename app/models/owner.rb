# frozen_string_literal: true
class Owner < ApplicationRecord
  validates :fname, :lname, presence: true, length: {maximum: 30}
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+([_ -.]?[a-zA-Z0-9])*\z/
  validates :username, presence: true, length: {maximum: 60}, uniqueness: {case_sensitive: false},
            format: {with: VALID_USERNAME_REGEX}
  has_many :products

end
