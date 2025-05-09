class FavoriteColorsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.favorite_colors.create(
      name: params[:name],
      hex: params[:hex]
    )

    redirect_back fallback_location: palette_path, notice: "Color added to favorites!"
  end

  def index
    @favorite_colors = current_user.favorite_colors
  end

  def destroy
    @favorite_color = current_user.favorite_colors.find(params[:id])
    @favorite_color.destroy
    redirect_to favorite_colors_path, notice: "Color removed from favorites."
  end
end
