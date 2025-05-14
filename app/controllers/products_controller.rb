class ProductsController < ApplicationController
  def index
  if params[:color].present?
    cleaned_color = params[:color].strip.downcase
    @products = Product.where("LOWER(TRIM(color)) = ?", cleaned_color)
  else
    @products = Product.all
  end
 end
end
