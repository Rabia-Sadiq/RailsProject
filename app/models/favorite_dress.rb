class FavoriteDress < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # validates :title, uniqueness: { scope: :user_id, message: "has already been favorited" }

end
