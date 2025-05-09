class FavoriteColor < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: { scope: :user_id, message: "has already been favorited" }

end
