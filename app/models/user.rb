class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :favorite_colors, dependent: :destroy
  has_many :favorite_dresses
  has_many :favorited_products, through: :favorite_dresses, source: :product

 
end
