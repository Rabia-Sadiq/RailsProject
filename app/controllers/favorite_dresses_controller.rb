class FavoriteDressesController < ApplicationController
  before_action :authenticate_user!

  def create
  favorite = current_user.favorite_dresses.create(product_id: params[:product_id])
  puts favorite.inspect   # or use Rails.logger.debug favorite.inspect
  redirect_back fallback_location: products_path, notice: "Dress added to favorites!"
  end


  def index
  @favorite_dresses = current_user.favorite_dresses.includes(:product)
  end

 def destroy
  Rails.logger.debug "Destroy params[:id]: #{params[:id]}"
  favorite = current_user.favorite_dresses.find(params[:id])
  favorite.destroy
  redirect_back fallback_location: favorite_dresses_path, notice: "Dress removed from favorites!"
 rescue ActiveRecord::RecordNotFound
  redirect_back fallback_location: favorite_dresses_path, alert: "Favorite dress not found."
 end






end
