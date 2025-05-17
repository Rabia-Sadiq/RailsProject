class Product < ApplicationRecord
  has_many :favorite_dresses
  has_many :favorited_by_users, through: :favorite_dresses, source: :user
end
